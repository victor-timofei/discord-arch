FROM ghcr.io/victor-timofei/arch-nightly:latest

RUN yes | pacman -S discord \
  pipewire \
  alsa-utils \
  && useradd \
  -u 1000 -m u1000

ENTRYPOINT [ "discord" ]
