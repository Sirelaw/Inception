FROM alpine:latest

RUN apk update && apk add nginx

RUN adduser -D -g 'Nginx www user' -h /home/www/ www

RUN mkdir -p /home/www/ && chown -R www:www /home/www/

RUN mkdir -p /etc/nginx/ && chown -R root:root /etc/nginx/

COPY --chown=www:www ./conf/nginx.conf /etc/nginx/nginx.conf

COPY --chown=www:www ./tools/certs/selfsigned.crt /etc/ssl/certs/selfsigned.crt

COPY --chown=www:www ./tools/certs/selfsigned.key /etc/ssl/private/selfsigned.key

ENTRYPOINT ["nginx", "-g", "daemon off;"]
