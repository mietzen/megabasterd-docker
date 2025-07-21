FROM jlesage/baseimage-gui:alpine-3.18-v4.9.0

ENV MEGABASTERD_VERSION="8.22"
ENV DOWNLOAD_URL="https://github.com/tonikelope/megabasterd/releases/download/v${MEGABASTERD_VERSION}/MegaBasterd_${MEGABASTERD_VERSION}.jar"
ENV APP_ICON="https://raw.githubusercontent.com/tonikelope/megabasterd/master/src/main/resources/images/pica_roja_big.png"

RUN add-pkg --no-cache \
    sqlite \
    openjdk17-jre \
    ttf-dejavu

RUN install_app_icon.sh ${APP_ICON}

COPY rootfs/ /
ADD --chmod=755 ${DOWNLOAD_URL} /defaults/MegaBasterd
RUN mv /defaults/MegaBasterd/MegaBasterd_${MEGABASTERD_VERSION}.jar /defaults/MegaBasterd/MegaBasterd.jar

RUN set-cont-env APP_NAME MegaBasterd && \
    set-cont-env DOCKER_IMAGE_VERSION ${MEGABASTERD_VERSION} && \
    set-cont-env APP_VERSION ${MEGABASTERD_VERSION}

VOLUME ["/output", "/config"]

EXPOSE 5800

LABEL \
      org.label-schema.name="MegaBasterd" \
      org.label-schema.description="Docker container for MegaBasterd" \
      org.label-schema.version="${MEGABASTERD_VERSION}" \
      org.label-schema.schema-version="1.0"
