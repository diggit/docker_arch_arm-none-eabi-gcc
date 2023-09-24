FROM archlinux/archlinux:latest
MAINTAINER Patrik Bachan (xorly) <patrikbachan@gmail.com>
LABEL Description="Image for building and debugging arm-embedded projects from git"
WORKDIR /work

ADD . /work

RUN pacman-key --init &&\
    pacman -Suy --noconfirm &&\
    pacman -S\
        base-devel\
        arm-none-eabi-gcc\
        arm-none-eabi-newlib\
        arm-none-eabi-binutils\
        git\
        cmake\
        make\
        ninja\
        python\
        diffutils\
        file\
        grep\
        sed\
        awk\
        patch\
        gzip\
        which\
        ponysay\
        cowsay\
        fortune-mod\
        cowfortune\
        --noconfirm &&\
    pacman -S\
        boost\
        ghostscript\
	doxygen\
	graphviz\
	psutils\
        --asdeps --noconfirm&&\
    useradd --no-create-home --shell=/bin/bash build && usermod -L build &&\
    mkdir build &&\
    chown build build
USER build
RUN cd build &&\
    git clone "https://aur.archlinux.org/srecord.git" &&\
    cd srecord &&\
    makepkg
USER root
RUN cd build/srecord &&\
    pacman -U *.pkg.tar* --noconfirm &&\
    pacman -Rs $(pacman -Qdtq) --noconfirm &&\
    pacman -Scc --noconfirm &&\
    cd ../.. &&\
    rm -rf build
