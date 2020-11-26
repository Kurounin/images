FROM        ubuntu:16.04

LABEL       author="kurounin" maintainer="wiseon3@yahoo.com"

RUN         dpkg --add-architecture i386 \
            && apt update \
            && apt upgrade -y \
            && apt install -y libstdc++5 libstdc++5:i386 tar curl iproute2 openssl tzdata \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]