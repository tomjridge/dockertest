# taken from https://github.com/avsm/docker-opam/blob/master/scripts/ubuntu-trusty/Dockerfile
# with failing last few lines removed
FROM ubuntu:trusty
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
ADD opam-installext /usr/bin/opam-installext
RUN apt-get -y update
RUN apt-get -y install sudo pkg-config git build-essential m4 software-properties-common aspcud unzip curl libx11-dev
ADD opam.list /etc/apt/sources.list.d/opam.list
RUN curl -OL http://download.opensuse.org/repositories/home:ocaml/xUbuntu_14.04/Release.key
RUN apt-key add - < Release.key
RUN apt-get -y update
RUN apt-get -y install opam ocaml
#RUN git clone git://github.com/ocaml/opam
#RUN sh -c "cd opam && make cold && make install"
#RUN git config --global user.email "docker@example.com"
#RUN git config --global user.name "Docker CI"
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam
USER opam
ENV HOME /home/opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1
WORKDIR /home/opam
USER root
RUN sudo -u opam opam init --comp=4.01.0 -a -y 
# RUN sudo -u opam opam init --comp=4.01.0 -a -y /home/opam
RUN sudo -u opam opam install ocamlfind
USER opam
WORKDIR /home/opam/