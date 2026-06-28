# Security Exposure Checklist

**Document Status:** Active  
**Owner:** Project Owner  
**Last Updated:** YYYY-MM-DD

Use this checklist before exposing any service, API, model server, dashboard, tunnel, webhook, storage bucket, CI/CD runner, or automation endpoint.

## Exposure Record

```text
Name:
Owner:
Purpose:
Environment:
Exposure level:
Port/domain:
Authentication:
Authorization scope:
Allowed users or IPs:
TLS:
Firewall/network control:
Logging location:
Monitoring/alert:
Rate limit/quota/timeout/resource limit:
Data sensitivity:
Secret handling:
Review date:
Expiry date:
Approval:
```

## Review Checklist

- [ ] Service has a named owner.
- [ ] Purpose is documented.
- [ ] Exposure level is classified as local, private, or public.
- [ ] IPv4 exposure was checked.
- [ ] IPv6 exposure was checked.
- [ ] Cloud firewall/security group was checked.
- [ ] DNS records were checked.
- [ ] Reverse proxy routes were checked.
- [ ] Tunnel tools were checked.
- [ ] Router port forwarding and UPnP were checked where applicable.
- [ ] Docker/container port publishing was checked.
- [ ] Authentication is enabled.
- [ ] Authorization uses least privilege.
- [ ] TLS is enabled for non-local traffic.
- [ ] Firewall, VPN, allowlist, or equivalent network control is enabled.
- [ ] Logs are enabled and stored in a known location.
- [ ] Monitoring or alerting is enabled.
- [ ] Rate limits, quotas, timeouts, or resource limits are configured.
- [ ] Secrets are not exposed in code, logs, prompts, screenshots, or docs.
- [ ] User-provided URLs, file paths, uploads, webhooks, and AI tool actions are restricted from internal services, metadata endpoints, secrets, and unauthorized files.
- [ ] Temporary access has an expiry date.
- [ ] Approval is documented.

## Quick Local Checks

macOS/Linux:

```bash
lsof -i -P -n | grep LISTEN
```

Linux:

```bash
ss -tulpn
```

Docker:

```bash
docker ps
```

Tunnel processes:

```bash
ps aux | grep -Ei 'cloudflared|ngrok|tailscale|frp|ssh.*-R|localtunnel|code tunnel'
```

Secret scan hint:

```bash
git grep -nEi 'api[_-]?key|secret|token|password|bearer|private_key|OLLAMA_HOST'
```

## Incident Checklist

- [ ] Close access first.
- [ ] Preserve logs.
- [ ] Identify source IPs and time range.
- [ ] Review exposed routes, ports, tunnels, firewall rules, and DNS.
- [ ] Review process, CPU/GPU, disk, bandwidth, and billing usage.
- [ ] Remove unauthorized jobs, models, files, or users.
- [ ] Rotate affected secrets.
- [ ] Document root cause.
- [ ] Add prevention rule before reopening.
