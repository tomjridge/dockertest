# taken from https://github.com/avsm/docker-opam/blob/master/scripts/ubuntu-trusty/Dockerfile
# with failing last few lines removed
FROM ubuntu:trusty
MAINTAINER Tom Ridge

# basic packages
RUN apt-get -y update
RUN apt-get -y install sudo pkg-config git build-essential m4 software-properties-common aspcud unzip curl libx11-dev

# where is this used?
ADD opam-installext /usr/bin/opam-installext

# ocaml and opam
RUN apt-get -y install ocaml opam

# add a user
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam

# switch to user
USER opam
ENV HOME /home/opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1
WORKDIR /home/opam
RUN opam init -a -y

# opam packages
RUN opam switch 4.01.0
RUN opam install ocamlfind sha

# link in directories - in Makefile
RUN echo "eval `opam config env`" >> ~/.bashrc
