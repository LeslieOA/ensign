#!/bin/bash

# Create necessary directories
mkdir -p /run/dbus

# Generate machine-id if it doesn't exist
if [ ! -e /var/lib/dbus/machine-id ]; then
    uuidgen > /var/lib/dbus/machine-id
fi

# Start the D-Bus system daemon
dbus-daemon --system --fork

# Start the D-Bus session daemon and set environment variables
eval "$(dbus-launch --sh-syntax)"
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket

# Start Xvfb (virtual framebuffer X server)
Xvfb :99 -screen 0 $SCREEN_GEOMETRY &

# Start Openbox WM
openbox-session &

# Start x11vnc server
x11vnc -display :99 -passwd yourpassword -listen 0.0.0.0 -forever &

# Start Chromium in kiosk mode
chromium --no-sandbox \
         --disable-gpu \
         --disable-software-rasterizer \
         --disable-dev-shm-usage \
         --disable-features=Vulkan \
         --display=:99 \
         --kiosk "https://mrdoob.com/lab/javascript/webgl/clouds/"
