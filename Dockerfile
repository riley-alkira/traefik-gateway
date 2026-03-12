FROM traefik:v3.3

RUN apk add --no-cache gettext

COPY traefik.yml /etc/traefik/traefik.yml
COPY dynamic.yml.template /etc/traefik/dynamic.yml.template

EXPOSE 8080

CMD ["/bin/sh", "-c", "envsubst < /etc/traefik/dynamic.yml.template > /etc/traefik/dynamic.yml && traefik --configFile=/etc/traefik/traefik.yml"]
