FROM python:3.13-slim

# Patch openssl security vulnerabilities
RUN apt-get update && \
    apt-get upgrade -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Prevent Python from buffering logs (critical for CloudWatch)
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set working directory
WORKDIR /app

# Copy and install dependencies first (layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only application code
COPY app.py .

# Expose application port
EXPOSE 5000

# Run application
CMD ["python", "app.py"]
