FROM alpine:3.13

LABEL name="docker-rclone" \
      maintainer="Jee jee@jeer.fr" \
      description="Rclone syncs files and directories to and from different cloud storage providers." \
      url="https://rclone.org" \
      org.label-schema.vcs-url="https://github.com/jee-r/docker-rclone"

ENV XDG_CONFIG_HOME=/config

RUN apk --no-cache --upgrade --virtual=build-dependencies add \
      unzip \
      wget && \
    apk --no-cache --upgrade add \
      ca-certificates \
      curl \
      fuse \
      tzdata && \
    wget https://downloads.rclone.org/rclone-current-linux-amd64.zip -O /tmp/rclone-current-linux-amd64.zip && \
    cd /tmp && \
    unzip rclone-current-linux-amd64.zip && \
    cp /tmp/rclone-*-linux-amd64/rclone /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    echo "user_allow_other" >> /etc/fuse.conf && \
    apk del --purge build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

WORKDIR /data

STOPSIGNAL SIGQUIT
ENTRYPOINT [ "rclone" ]
