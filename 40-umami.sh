#!/bin/sh
set -eu

# Renderiza index.html con la config de Umami; se puede sobreescribir por entorno.
export UMAMI_SRC="${UMAMI_SRC:-https://umami.vecthor.cl/script.js}"
export UMAMI_WEBSITE_ID="${UMAMI_WEBSITE_ID:-d79bb8fb-0193-4819-aad9-74a16b0a1b55}"

envsubst '${UMAMI_SRC} ${UMAMI_WEBSITE_ID}' \
  < /usr/share/nginx/html/index.html.tmpl \
  > /usr/share/nginx/html/index.html
