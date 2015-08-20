# taken from https://github.com/avsm/docker-opam/blob/master/scripts/ubuntu-trusty/Dockerfile
# with failing last few lines removed
# 14.04 was failing to pull some packages from ubuntu security server (old?)
# 14.10 is ok
FROM ubuntu:12.04
MAINTAINER Tom Ridge

# basic packages
RUN apt-get -y update
RUN apt-get -y install  curl wget
RUN apt-get -y install  sudo
RUN chmod u+s /usr/bin/sudo
RUN sudo apt-get install bzip2

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

