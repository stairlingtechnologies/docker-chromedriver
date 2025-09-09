FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium chromium-driver \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Create user/group like in systemd
RUN groupadd -r chromedriver && useradd -r -g chromedriver chromedriver
USER chromedriver

# Working directory
WORKDIR /home/chromedriver

# Default environment (like Environment=DISPLAY=:0)
ENV DISPLAY=:99

# Expose chromedriver port
EXPOSE 9515

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

