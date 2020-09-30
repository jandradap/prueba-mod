FROM alpine:latest
MAINTAINER Alejandro Morales Gracia "ale95mogra@gmail.com"

RUN apk update \
    && apk add apache2 \
    && apk add libapache2-mod-auth-pgsql

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN a2enmod 000_auth_pgsql

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
