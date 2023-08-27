# Readme for VNC inside this Coder image

A [sample image](https://github.com/cdr/enterprise-images/tree/main/images/vnc) for Coder that uses [noVNC](https://github.com/novnc/noVNC) as the client and [TurboVNC](https://www.turbovnc.org/) as the server. You can find it on [Dockerhub](https://hub.docker.com/r/marktmilligan/vnc).

## To connect

### Option 1 (browser)

Start VNC

```sh
# start VNC
echo "Creating XFCE desktop..."
mkdir -p "$XFCE_DEST_DIR"
cp -rT "$XFCE_BASE_DIR" "$XFCE_DEST_DIR"
# Skip default shell config prompt.
cp /etc/zsh/newuser.zshrc.recommended $HOME/.zshrc
echo "Initializing Supervisor..."
nohup supervisord >/dev/null 2>&1 &
```

Create a `coder_app` in the Coder template for noVNC on port `6081` 

### Option 2 (SSH Tunneling)

Use SSH tunneling to expose the VNC server to your local machine. Download the Coder CLI and a VNC client installed on your local machine.

    `curl -fsSL https://coder.com/install.sh | sh`

Update the `~/.ssh/config` using the Coder CLI

    ```sh
    coder login <your Coder Access URL>
    coder tunnel <your Coder workspace name> --tcp 6081:6081
    # You will not see any output if it succeeds, but you
    # will be able to connect your VNC client to localhost:5990
    ```
