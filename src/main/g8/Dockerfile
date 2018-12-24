FROM alpine:3.7
RUN apk add --update nginx tini && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body

COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY dist /usr/share/nginx/html

ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
