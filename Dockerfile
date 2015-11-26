FROM base/archlinux:2015.06.01

# add unprivileged user
RUN useradd -ms /bin/bash runner

# install needed packages for running tests
RUN pacman -Syyu --noconfirm python-tox python2-tox \
    python-pip python2-pip git 

# install gcc (for hyperkitty)
RUN pacman -S --noconfirm gcc

# install python3.4 (for Mailman)
COPY python34-3.4.3-1-x86_64.pkg.tar.xz /tmp/
RUN pacman -U --noconfirm /tmp/python34-3.4.3-1-x86_64.pkg.tar.xz

# install setuptools, pip tox for python3.4
WORKDIR /tmp
RUN curl https://bootstrap.pypa.io/ez_setup.py -o - | python3.4
RUN curl -O "https://pypi.python.org/packages/source/p/pip/pip-7.1.2.tar.gz" && \
    tar xzf pip-7.1.2.tar.gz && \
    cd pip-7.1.2 && python3.4 setup.py install
RUN pip3.4 install tox


# empty caches
RUN rm -rf /var/cache/pacman/pkg/* /tmp/*

# set working dir
USER runner
WORKDIR /home/runner
