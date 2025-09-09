#!/bin/bash
set -e

# Start X virtual framebuffer for Chrome
Xvfb :99 -screen 0 1280x1024x24 &

# Launch chromedriver with same args, but log to stdout
exec /usr/bin/chromedriver \
  --disable-ipv6 \
  --port=9515 \
  --whitelisted-ips="" \
  --allowed-origins="http://localhost" \
  --log-level=ALL
