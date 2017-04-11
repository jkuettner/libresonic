FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -ms /bin/bash libresonic
RUN apt-get update \
    && apt-get install -y \
        wget \
        openjdk-8-jdk-headless \
        libav-tools

ENV MEDIA_DIR "/media"
ENV CONFIG_DIR "/config"
ENV SERVER_PORT 8080
ENV SERVER_ADDRESS "0.0.0.0"
ENV LANG en_US.UTF-8

ADD bin/libresonic /usr/bin/libresonic
RUN wget -O /home/libresonic/libresonic.war \
    https://github.com/Libresonic/libresonic/releases/download/v6.2.beta3/libresonic-v6.2.beta3.war
RUN mkdir -p ${MEDIA_DIR} ${CONFIG_DIR} \
    && chown libresonic:libresonic -R /home/libresonic ${MEDIA_DIR} ${CONFIG_DIR} \
    && chmod +x /usr/bin/libresonic

USER libresonic

CMD ["/usr/bin/libresonic"]