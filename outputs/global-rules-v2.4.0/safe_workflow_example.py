"""Offline executable example, NOT a runtime enforcement layer or LLM benchmark.

All worker data and writes are inside one TemporaryDirectory. No network,
credentials, deployments, privilege changes, git writes, or external AI calls.
The parent supervises the bounded worker and validates content after copy.
"""
import hashlib
import json
import subprocess
import sys
import tempfile
import time
from pathlib import Path


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def artifact_gate(path, expected_text, expected_hash):
    return path.is_file() and path.read_text() == expected_text and digest(path) == expected_hash


def run():
    start = time.perf_counter()
    observations = []
    def record(name, passed, **evidence):
        observations.append(dict(name=name, passed=bool(passed), **evidence))
        if not passed:
            raise AssertionError(name)

    with tempfile.TemporaryDirectory(prefix="brainos-safe-example-") as folder:
        root = Path(folder)
        source = root / "source.txt"
        source.write_text("BrainOS local example\n")
        backup = root / "source.backup.txt"
        backup.write_bytes(source.read_bytes())
        target = root / "published.txt"
        staged = root / "result.txt"
        expected = "BrainOS LOCAL example\n"
        expected_hash = hashlib.sha256(expected.encode()).hexdigest()
        record("preflight_and_restore", digest(source) == digest(backup),
               destination_exists=root.is_dir(), scope="disposable local folder")

        # Real zero-exit process deliberately produces no artifact: gate must reject it.
        false_success = subprocess.run([sys.executable, "-c", "print('SUCCESS')"],
                                       cwd=root, capture_output=True, text=True, timeout=5)
        record("reject_exit_zero_without_artifact",
               false_success.returncode == 0 and not artifact_gate(staged, expected, expected_hash))

        # One parent-owned writer. communicate owns consumption and imposes a deadline.
        script = ("from pathlib import Path; "
                  "p=Path('source.txt'); "
                  "Path('result.txt').write_text(p.read_text().replace('local','LOCAL')); "
                  "print('artifact_written')")
        launch = time.perf_counter()
        process = subprocess.Popen([sys.executable, "-c", script], cwd=root,
                                   stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        pid = process.pid
        try:
            stdout, stderr = process.communicate(timeout=5)
        except subprocess.TimeoutExpired:
            process.kill()
            process.communicate()
            raise
        wait_seconds = time.perf_counter() - launch
        record("supervised_single_writer", process.returncode == 0 and
               artifact_gate(staged, expected, expected_hash), pid=pid,
               result_consumer="parent", deadline_seconds=5,
               wait_seconds=wait_seconds, milestone=stdout.strip())

        target.write_bytes(staged.read_bytes())
        record("readback_exact_local_destination",
               artifact_gate(target, expected, expected_hash), sha256=digest(target))
        target.write_text("tampered\n")
        record("reject_changed_artifact", not artifact_gate(target, expected, expected_hash))
        target.write_bytes(staged.read_bytes())
        record("in_scope_repair_and_reverify", artifact_gate(target, expected, expected_hash))
        source.write_bytes(backup.read_bytes())
        record("restore_byte_match", source.read_bytes() == backup.read_bytes())

    record("temporary_workspace_removed", not root.exists())
    return {"status": "PASS", "checks": observations,
            "elapsed_seconds": time.perf_counter() - start,
            "proven": "offline deterministic example produced, verified, repaired and restored real files",
            "not_proven": ["LLM continuity under live user interjections",
                           "automatic enforcement across agents or production",
                           "speed improvement relative to a baseline"],
            "production_access": False, "system_permission_changes": False}


if __name__ == "__main__":
    print(json.dumps(run(), ensure_ascii=False, indent=2))
