# taken from https://github.com/avsm/docker-opam/blob/master/scripts/ubuntu-trusty/Dockerfile
# with failing last few lines removed
# 14.04 was failing to pull some packages from ubuntu security server (old?)
# 14.10 is ok
FROM base/arch
MAINTAINER Tom Ridge

# add a user
RUN useradd -m -g users -G wheel -s /bin/bash opam
RUN passwd -l opam
# RUN pacman -Su
RUN pacman -Syy
RUN pacman -Syu
RUN pacman --noconfirm -S sudo wget
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam

# switch to user
USER opam
ENV USER opam
ENV HOME /home/opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1
WORKDIR /home/opam

