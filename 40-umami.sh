#!/bin/sh
set -eu

# Umami first-party: el host y el website id se configuran por entorno.
export UMAMI_HOST="${UMAMI_HOST:-https://umami.vecthor.cl}"
UMAMI_HOST="${UMAMI_HOST%/}"
export UMAMI_WEBSITE_ID="${UMAMI_WEBSITE_ID:-d79bb8fb-0193-4819-aad9-74a16b0a1b55}"

envsubst '${UMAMI_HOST}' < /etc/nginx/default.conf.tmpl > /etc/nginx/conf.d/default.conf
envsubst '${UMAMI_WEBSITE_ID}' \
  < /usr/share/nginx/html/index.html.tmpl \
  > /usr/share/nginx/html/index.html
