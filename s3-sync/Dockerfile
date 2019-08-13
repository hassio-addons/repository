ARG BUILD_FROM
FROM $BUILD_FROM

COPY rootfs /

RUN apk add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

WORKDIR /

# Run as soon as the container is started
CMD ["/usr/bin/run.sh"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="S3Sync" \
    io.hass.description="S3 Sync Addon" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Steven Luther <steve.luther@gmail.com>" \
    org.label-schema.description="Sync Backups to S3" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="S3Sync" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://lutherlabs.com" \
    org.label-schema.usage="https://github.com/luthes/hassio-s3-sync/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/luthes/hassio-s3-sync" \
    org.label-schema.vendor="S3 Sync Addon"
