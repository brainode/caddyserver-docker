FROM lsiobase/alpine

ENV ROOT_DIRECTORY=/caddyserver
ENV CONF_DIRECTORY=/caddyserver/cfg
ENV WWW_DIRECTORY=/caddyserver/www
ENV LOGS_DIRECTORY=/caddyserver/logs
ENV CERTS=/root/.caddy

VOLUME $CONF_DIRECTORY $WWW_DIRECTORY $LOGS_DIRECTORY $CERTS

RUN apk add --no-cache openssh-client git

COPY root/ /
COPY caddy $ROOT_DIRECTORY


ENV Email=''
ENV CPU=''

EXPOSE 80 443 2015

CMD $ROOT_DIRECTORY/caddy -conf $ROOT_DIRECTORY/cfg/Caddyfile -log $ROOT_DIRECTORY/logs/caddy.log -cpu $CPU -email $EMAIL -agree
#CMD ["/opt/caddy/caddy","-conf","./cfg","-log","/opt/caddy/logs/caddy.log"]
#https://caddyserver.com/download/linux/amd64?plugins=http.cache,http.cgi,http.expires,http.filter,http.forwardproxy,http.geoip,http.git,http.ipfilter,http.locale,http.login,http.minify,http.nobots,http.upload,http.webdav,net&license=personal&telemetry=off
