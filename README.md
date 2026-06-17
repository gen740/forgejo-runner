# forgejo-runner

Minimal Nix-based image with Node.js for Forgejo Actions jobs.

Published image:

```sh
docker pull ghcr.io/gen740/forgejo-runner:latest
```

## Included packages

- nixos/nix:latest
- bash
- cacert
- coreutils
- curl
- git
- nodejs_22, including npm

## Forgejo usage

Use this image as the container image for jobs that need a small Linux
environment with Node.js available:

```yaml
jobs:
  test:
    runs-on: docker
    container:
      image: ghcr.io/gen740/forgejo-runner:latest
    steps:
      - uses: actions/checkout@v4
      - run: node --version
      - run: npm --version
```

## Publishing

The GitHub Actions workflow builds the image on pull requests and publishes it
to GitHub Container Registry on pushes to `main` and `v*.*.*` tags.

Tags published from `main`:

- `latest`
- `main`
- `sha-<commit>`

Release tags such as `v1.0.0` publish a matching image tag.
