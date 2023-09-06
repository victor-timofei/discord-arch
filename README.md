# discord-arch
A Discord container image based on Arch Linux

## Runing it
Unfortunately currently Discord requires X11.
Currently this image only supports running as a user with UID 1000.
Currently the sound is not working.

```bash
xhost +local:* # allow unauthenticated connections via the unix socket.
podman run --rm -e XDG_RUNTIME_DIR=/tmp -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --user=$(id -u):$(id -g) -v /run/user/$(id -u)/pipewire-0:/tmp/pipewire-0 --pull always ghcr.io/victor-timofei/discord-arch:latest
```
