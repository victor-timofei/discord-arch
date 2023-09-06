# discord-arch
A Discord container image based on Arch Linux

## Why

Discord is notorious for its telemetry collection. Running the application in
a container can help minimize the data it collects from you.

But why not, AppImages or Flatpacks? Because I already know Docker-style containers and I already have that installed.

## Running it

```bash
xhost +local:* # allow unauthenticated connections via the unix socket.
podman run --rm \
  -e XDG_RUNTIME_DIR=/tmp \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --user=$(id -u):$(id -g) \
  -v /run/user/$(id -u)/pipewire-0:/tmp/pipewire-0 \
  --pull always \
  ghcr.io/victor-timofei/discord-arch:latest
```

If you want to cache the discord updates and keep your login session, you can mount the `/home`
dir to a volume.

```bash
podman run --rm \
  -e XDG_RUNTIME_DIR=/tmp \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --user=$(id -u):$(id -g) \
  -v /run/user/$(id -u)/pipewire-0:/tmp/pipewire-0 \
  --pull always \
  --mount type=volume,source=discord,target=/home \
  ghcr.io/victor-timofei/discord-arch:latest
```

## Limitations
- Unfortunately currently Discord requires X11.
- Currently this image only supports running as a user with UID 1000.
- Currently the sound is not working.
