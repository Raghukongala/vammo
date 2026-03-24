FROM python:3.13-slim

# Patch openssl security vulnerabilities
RUN apt-get update && \
    apt-get upgrade -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN pip install flask

# Expose application port
EXPOSE 5000

# Run application
CMD ["python", "app.py"]
