FROM base/archlinux:2015.06.01

# add unprivileged user
RUN useradd -ms /bin/bash runner

# install needed packages for running tests
RUN pacman -Syyu --noconfirm python-tox python2-tox \
    python-pip python2-pip git 

# install postgresql (for Mailman)
RUN pacman -S --noconfirm postgresql

# install gcc (for hyperkitty)
RUN pacman -S --noconfirm gcc

# empty caches
RUN rm -rf /var/cache/pacman/pkg/*

# set working dir
USER runner
WORKDIR /home/runner
