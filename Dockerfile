#
# firefox Dockerfile
#
# https://github.com/jlesage/docker-firefox
#

# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-22.04-v4.6.4

# Configure environment
ENV DOCKER_IMAGE_NAME='gnasello/firefox-ubuntu'
ENV VERSION='2024-11-17' 

# Install Firefox.
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      apulse \
      unzip \
      bzip2 \
      wget \
      xterm \
      ca-certificates \
      libgtk-3-0 \
      libdbus-glib-1-2 \
      libx11-xcb1 \
      libxtst6 && \
      \
      rm -rf /var/lib/apt/lists/*
  
  ENV FF_INSTALLER_NAME=firefox-latest.tar.bz2
  RUN cd /tmp && \
      wget --progress=dot:mega -O ${FF_INSTALLER_NAME} \
           'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US' && \
      tar -x -C /usr/local/bin -f ${FF_INSTALLER_NAME} && \
      chmod -R 777 /usr/local/bin/firefox && \
      rm -f ${FF_INSTALLER_NAME}
  

# Generate and install favicons.
RUN \
    APP_ICON_URL=https://github.com/jlesage/docker-templates/raw/master/jlesage/images/firefox-icon.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Add files.
COPY rootfs/ /

# Set environment variables.
ENV APP_NAME="Firefox"

# Metadata.
LABEL \
      org.label-schema.name="firefox" \
      org.label-schema.description="Docker container for Firefox" \
      org.label-schema.version="unknown" \
      org.label-schema.vcs-url="https://github.com/jlesage/docker-firefox" \
      org.label-schema.schema-version="1.0"