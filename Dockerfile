FROM fredboat/lavalink:b7318d1-alpine
USER root

RUN apk add --no-cache python3 py3-pip \
    && pip3 install --break-system-packages --no-cache-dir yt-dlp

# Switch back to the image's original non-root user for runtime.
# Fredboat/lavalink-devs images commonly use "lavalink" — verify below if this fails.
USER lavalink

WORKDIR /opt/Lavalink
COPY application.yml application.yml

EXPOSE 2333

