# Base image for E2E testing
# Playwright + Bun + all browsers (Chromium, Firefox, WebKit, Chrome)
# Note: Using linux/amd64 because Google Chrome is not available for ARM64
ARG PLATFORM=linux/amd64
FROM --platform=${PLATFORM} mcr.microsoft.com/playwright:v1.57.0-jammy

LABEL org.opencontainers.image.title="playwright-bun"
LABEL org.opencontainers.image.description="Playwright with Bun runtime and all browsers (Chromium, Firefox, WebKit, Chrome)"
LABEL org.opencontainers.image.version="1.57.0"
LABEL org.opencontainers.image.authors="mosadif"
LABEL org.opencontainers.image.source="https://github.com/mosadif/playwright-bun"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.base.name="mcr.microsoft.com/playwright:v1.57.0-jammy"

# Install dependencies and Bun
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# Working directory for mounting project
WORKDIR /app

# Install Google Chrome
RUN npx playwright install chrome

# Verify installation
RUN bun --version && npx playwright --version

CMD ["bash"]
