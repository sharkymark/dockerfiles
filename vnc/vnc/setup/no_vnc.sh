#!/usr/bin/env bash
set -euo pipefail

echo "Install noVNC - HTML5 based VNC viewer"
mkdir -p "$NO_VNC_HOME/utils/websockify"
wget -qO- https://github.com/novnc/noVNC/archive/v1.4.0.tar.gz | tar xz --strip 1 -C "$NO_VNC_HOME"
wget -qO- https://github.com/novnc/websockify/archive/v0.11.0.tar.gz | tar xz --strip 1 -C "$NO_VNC_HOME/utils/websockify"

# 2023-08-27 comment - no launch.sh in noVNC 1.3.0 and higher
# chmod +x -v "$NO_VNC_HOME"/utils/*.sh

## Substitute an index with settings optimized for Coder e.g., auto-connect
ln -s "$VNC_ROOT_DIR/index.html" "$NO_VNC_HOME/index.html"
