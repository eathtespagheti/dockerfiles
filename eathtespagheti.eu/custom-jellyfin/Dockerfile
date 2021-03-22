FROM ghcr.io/linuxserver/jellyfin
RUN apt update -y
RUN apt install -y gpg-agent wget
RUN wget -qO - https://repositories.intel.com/graphics/intel-graphics.key | apt-key add -
RUN echo 'deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu focal main' >> /etc/apt/sources.list
RUN apt update -y
RUN apt install --only-upgrade -y intel-media-va-driver-non-free
RUN apt remove gpg-agent wget -y
RUN apt upgrade -y