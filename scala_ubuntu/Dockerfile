# taken from https://github.com/avsm/docker-opam/blob/master/scripts/ubuntu-trusty/Dockerfile
# with failing last few lines removed
# 14.04 was failing to pull some packages from ubuntu security server
FROM ubuntu:15.10
MAINTAINER Tom Ridge

# basic packages
# -qq http://stackoverflow.com/questions/27273412/cannot-install-packages-inside-docker-ubuntu-image
RUN apt-get -y update
RUN apt-get -y install  curl
RUN apt-get -y install  bzip2
RUN apt-get -y install  libdigest-sha-perl
RUN apt-get -y install sudo
RUN chmod u+s /usr/bin/sudo

# where is this used?
#ADD opam-installext /usr/bin/opam-installext

# ocaml and opam
# RUN apt-get -y install ocaml opam

# add a user
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
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

RUN echo dummy to force rebuild
RUN curl https://nixos.org/nix/install | sh
RUN echo "if [ -e /home/opam/.nix-profile/etc/profile.d/nix.sh ]; then . /home/opam/.nix-profile/etc/profile.d/nix.sh; fi" >> .bashrc 
RUN . /home/opam/.nix-profile/etc/profile.d/nix.sh && nix-channel --update && nix-env -i -A nixpkgs.ocaml nixpkgs.ocamlPackages.findlib
RUN . /home/opam/.nix-profile/etc/profile.d/nix.sh && nix-channel --update && nix-env -i -A nixpkgs.scala nixpkgs.sbt
RUN . /home/opam/.nix-profile/etc/profile.d/nix.sh && sbt
# # following have to happen after running and binding path
# # RUN . /home/opam/.nix-profile/etc/profile.d/nix.sh
# # RUN cd /tmp/l/github/super/p3
# # RUN nix-build
