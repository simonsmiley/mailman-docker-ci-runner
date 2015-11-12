FROM base/archlinux

# install needed packages
RUN pacman -Syyu --noconfirm --needed python-tox python2-tox \
    python-pip python2-pip git \
    && rm -rf /var/cache/pacman/pkg/*

# add unprivileged user
RUN useradd -ms /bin/bash runner
ENV HOME /home/runner
USER runner
WORKDIR /home/runner
