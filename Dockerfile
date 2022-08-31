FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

RUN apt-get update

# xorg-server をインストールする。
RUN apt-get install -y --no-install-recommends debconf-utils && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    echo keyboard-configuration keyboard-configuration/layout select 'Japanese' | debconf-set-selections && \
    echo keyboard-configuration keyboard-configuration/layoutcode select 'jp' | debconf-set-selections && \
    apt-get install -y --no-install-recommends xorg

# ssh-server をインストールする。
RUN apt-get install -y --no-install-recommends openssh-server && \
    echo PermitRootLogin yes >> /etc/ssh/sshd_config  && \
    echo "root:root" | chpasswd

RUN apt-get install -y --no-install-recommends vim

RUN echo 'export DISPLAY=host.docker.internal:0.0' >> $HOME/.bashrc

RUN mkdir -p /root/work

WORKDIR /root/work

RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
