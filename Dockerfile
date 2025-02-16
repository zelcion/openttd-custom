FROM ubuntu:22.04

ARG OPENTTD_VERSION="14.1"
ARG OPENGFX_VERSION="7.1"

ADD prepare.sh /tmp/prepare.sh
ADD cleanup.sh /tmp/cleanup.sh
ADD buildconfig /tmp/buildconfig
ADD --chown=1000:1000 openttd.sh /openttd.sh

RUN chmod +x /tmp/prepare.sh /tmp/cleanup.sh /openttd.sh
RUN /tmp/prepare.sh \
    && /tmp/cleanup.sh

COPY ./config/openttd/ /home/openttd/.config/openttd/
COPY ./local/share/openttd/ /home/openttd/.local/share/openttd/

RUN chmod -R 777 /home/openttd/.config/openttd /home/openttd/.local/share/openttd

RUN mkdir -p /ottd-settings/config/openttd
RUN mkdir -p /ottd-settings/local/share/openttd
RUN cp -r /home/openttd/.config/openttd/* /ottd-settings/config/openttd
RUN cp -r /home/openttd/.local/share/openttd/* /ottd-settings/local/share/openttd/

VOLUME ["/home/openttd/.config/openttd", "/home/openttd/.local/share/openttd"]

EXPOSE 3979/tcp
EXPOSE 3979/udp

STOPSIGNAL 3
ENTRYPOINT [ "/usr/bin/dumb-init", "--rewrite", "15:3", "--rewrite", "9:3", "--" ]
CMD [ "/openttd.sh" ]
