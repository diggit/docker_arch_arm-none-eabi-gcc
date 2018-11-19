FROM archimg/base
MAINTAINER Patrik Bachan (xorly) <patrikbachan@gmail.com>
LABEL Description="Image for building and debugging arm-embedded projects from git"
WORKDIR /work

ADD . /work

# Install any needed packages specified in requirements.txt
RUN pacman -Sy --noconfirm &&\
    pacman -S git arm-none-eabi-gcc arm-none-eabi-newlib make --noconfirm