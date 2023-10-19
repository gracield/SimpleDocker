FROM nginx

USER root

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.c /home/server.c
COPY start_server.sh /home/start_server.sh

RUN apt-get update && apt-get install -y \ 
    gcc \
    spawn-fcgi \ 
    libfcgi-dev \ 
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /home/start_server.sh

WORKDIR /home/

ENTRYPOINT (bash /home/start_server.sh)

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost/ || exit 1
