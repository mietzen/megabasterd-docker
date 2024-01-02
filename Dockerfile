FROM jlesage/baseimage-gui:alpine-3.18-v4.5.3

ARG VERSION="8.21"
ENV DOWNLOAD_URL="https://github.com/tonikelope/megabasterd/releases/download/v${VERSION}/MegaBasterd_${VERSION}.jar"

RUN add-pkg \
    java-common \
    openjdk8-jre \
    jq \
    ttf-dejavu \
    rtmpdump \
    moreutils

RUN \
    APP_ICON=https://raw.githubusercontent.com/simple-icons/simple-icons/master/icons/mega.svg && \
    install_app_icon.sh "${APP_ICON}"

COPY rootfs/ /
RUN mkdir -p /defaults/MegaBasterd
ADD --chmod=755 DOWNLOAD_URL /defaults/MegaBasterd

RUN \
    set-cont-env APP_NAME "MegaBasterd" && \
    set-cont-env VERSION "${VERSION}" && \
    true

VOLUME ["/output", "/config"]

EXPOSE 5800

LABEL \
      org.label-schema.name="MegaBasterd" \
      org.label-schema.description="Docker container for MegaBasterd" \
      org.label-schema.schema-version="1.0"
