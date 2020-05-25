FROM archlinux/base:latest
MAINTAINER Patrik Bachan (xorly) <patrikbachan@gmail.com>
LABEL Description="Image for building and debugging arm-embedded projects from git"
WORKDIR /work

ADD . /work

# Install any needed packages specified in requirements.txt
RUN pacman -Syu --noconfirm &&\
    pacman -S git arm-none-eabi-gcc arm-none-eabi-newlib cmake make ninja --noconfirm
