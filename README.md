# playwright-bun

[![GitHub Container Registry](https://img.shields.io/badge/ghcr.io-playwright--bun-blue?logo=github)](https://github.com/mosadif/playwright-bun/pkgs/container/playwright-bun)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Docker image with [Playwright](https://playwright.dev/) and [Bun](https://bun.sh/) runtime for E2E testing.

## Features

- **Playwright** 1.49.1 with all browsers pre-installed
- **Bun** runtime (latest version)
- **Browsers included:**
  - Chromium
  - Firefox
  - WebKit
  - Google Chrome

## Quick Start

```bash
docker pull ghcr.io/mosadif/playwright-bun:latest
```

## Usage

### Run Tests

```bash
docker run --rm -v $(pwd):/app ghcr.io/mosadif/playwright-bun:latest \
  bash -c "bun install && bunx playwright test"
```

### Run Tests in Specific Browser

```bash
# Chromium
docker run --rm -v $(pwd):/app ghcr.io/mosadif/playwright-bun:latest \
  bash -c "bun install && bunx playwright test --project=chromium"

# Firefox
docker run --rm -v $(pwd):/app ghcr.io/mosadif/playwright-bun:latest \
  bash -c "bun install && bunx playwright test --project=firefox"

# WebKit
docker run --rm -v $(pwd):/app ghcr.io/mosadif/playwright-bun:latest \
  bash -c "bun install && bunx playwright test --project=webkit"
```

### Interactive Mode

```bash
docker run --rm -it -v $(pwd):/app ghcr.io/mosadif/playwright-bun:latest bash
```

### With Environment Variables

```bash
docker run --rm -v $(pwd):/app --env-file .env ghcr.io/mosadif/playwright-bun:latest \
  bash -c "bun install && bunx playwright test"
```

### Save Reports

```bash
docker run --rm \
  -v $(pwd):/app \
  -v $(pwd)/playwright-report:/app/playwright-report \
  -v $(pwd)/test-results:/app/test-results \
  ghcr.io/mosadif/playwright-bun:latest \
  bash -c "bun install && bunx playwright test"
```

## Tags

When a new git tag is pushed (e.g., `v1.49.1`), the following Docker tags are automatically created:

| Tag | Description | Example |
|-----|-------------|---------|
| `latest` | Latest stable version | `ghcr.io/mosadif/playwright-bun:latest` |
| `<version>` | Full semantic version | `ghcr.io/mosadif/playwright-bun:1.49.1` |
| `<major>.<minor>` | Major.minor version | `ghcr.io/mosadif/playwright-bun:1.49` |

## Building Locally

```bash
docker build -t playwright-bun .
```

## Publishing

This image is automatically built and published to GitHub Container Registry when a new tag is created:

```bash
git tag v1.49.1
git push origin v1.49.1
```

The GitHub Actions workflow will:
1. Build the Docker image
2. Push to `ghcr.io/mosadif/playwright-bun` with tags:
   - `v1.49.1` (full version)
   - `1.49` (major.minor)
   - `latest`

## License

MIT License - see [LICENSE](LICENSE) for details.
