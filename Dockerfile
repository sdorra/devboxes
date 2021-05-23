FROM ubuntu:focal-20210416

# Install binaries needed by devboxes
RUN apt-get update && \
    apt-get install -y \
      sudo \
      ansible \ 
      unzip \
      fontconfig # fc-cache

# Enable snap inside container 🙈
# See https://github.com/ogra1/snapd-docker/blob/3a38d17a30d8295f6099b4e5769f54763e92ad4a/build.sh#L84
RUN apt-get install -y fuse snapd snap-confine squashfuse init && \
 apt-get clean && \
 dpkg-divert --local --rename --add /sbin/udevadm && \
 ln -s /bin/true /sbin/udevadm
RUN systemctl enable snapd
VOLUME ["/sys/fs/cgroup"]
ENV container docker

# Use a mock instead of installing Gnome (1,6GB) inside the container
RUN echo 'echo gsettings mock' > /usr/bin/gsettings && chmod +x /usr/bin/gsettings  

# This sets the password 'box'. 
# Its a hashed value and was generated via "useradd dev" in an interactive shell and extracted from /etc/shadow
RUN useradd -m -p '$6$dcac3osTmIrBAB7p$o6iwk3hirHgS3lQdS2yrFDMmeZRe5JS9vJlra6Cam.AVedpUMtJWFiQNoE2eePeuIM4yzz5cbkBtnutDxY.7D/' -s /bin/bash dev && \
 usermod -aG sudo dev

CMD [ "/sbin/init" ]
