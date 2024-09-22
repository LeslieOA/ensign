# Debian Bullseye as base image
FROM debian:bullseye

# Install packages
RUN apt-get update && apt-get install -y \
    chromium \
    openbox \
    x11vnc \
    xvfb \
    wget \
    ca-certificates \
    python3-xdg \
    dbus \
    libgl1-mesa-dri \
    libegl1 \
    libgl1 \
    upower \
    uuid-runtime \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV DISPLAY=:99
ENV SCREEN_GEOMETRY=1920x1080x16

# Expose VNC
EXPOSE 5900

# Create startup script directory
RUN mkdir -p /root/scripts

# Copy the startup script to the container
COPY start.sh /root/scripts/start.sh

# Make script executable
RUN chmod +x /root/scripts/start.sh

# Set the entrypoint to startup script
ENTRYPOINT ["/root/scripts/start.sh"]
