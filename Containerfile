FROM ghcr.io/victor-timofei/arch-nightly:latest

RUN yes | pacman -S discord

ENTRYPOINT [ "discord" ]
