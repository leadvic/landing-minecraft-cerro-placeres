FROM nginx:alpine-slim

COPY nginx.conf.tmpl /etc/nginx/default.conf.tmpl
COPY index.html /usr/share/nginx/html/index.html.tmpl
COPY recipes /usr/share/nginx/html/recipes
COPY --chmod=755 40-umami.sh /docker-entrypoint.d/40-umami.sh

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1
