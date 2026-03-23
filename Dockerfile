FROM python:3.13-slim

# Patch openssl - fixes CVE-2025-15467 (CRITICAL), CVE-2025-69419, CVE-2025-69421 (HIGH)
RUN apt-get update && \
    apt-get upgrade -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# rest of your existing Dockerfile below...
