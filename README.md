# EraMesh Deploy Lab — CI/CD starter

A minimal ASP.NET Core 10 test service with Docker build, smoke test, and GitHub Actions publishing to GHCR.

## Create the GitHub repository

Create a new repository named `eramesh-deploy-lab` under `sholehamed`, then push these files to its `main` branch.

```bash
git init
git add .
git commit -m "Initial CI/CD lab"
git branch -M main
git remote add origin https://github.com/sholehamed/eramesh-deploy-lab.git
git push -u origin main
```

The workflow runs on GitHub-hosted `ubuntu-latest`. It builds an image, tests `/health`, and publishes `latest` plus a commit SHA tag to `ghcr.io/sholehamed/eramesh-deploy-lab`.

## Package visibility

GHCR packages are not necessarily public by default, even if the repository is public. For a non-sensitive demo, make the package Public under GitHub package settings after its first successful publish, or configure a read-only token for the VPS. Do not put tokens into the repository or chat.

## Server deployment

1. Verify real GHCR image pulling works from your VPS (e.g. `sudo docker pull ghcr.io/stefanprodan/podinfo:6.15.0`).
2. After publishing the package and configuring visibility/auth, copy `deploy/compose.yml` to `/srv/eramesh/apps/deploy-lab/compose.yml` on the VPS.
3. Run `sudo docker compose pull && sudo docker compose up -d` in that directory.
4. Add `deploy/caddy-route.txt` lines inside the existing Caddy `:80` block.
5. Validate and reload Caddy, then test `curl -i -H 'Host: lab.eramesh.ir' http://127.0.0.1:8080/health`.

There is **no automatic SSH deployment** in this starter. Publication is automatic; deployment is manual and controlled. Add a restricted deploy identity and automated rollback only after validating the image supply chain and GHCR pull on the VPS.

All domains are illustrative test routes. Do not expose this HTTP endpoint to real users before HTTPS is configured.
