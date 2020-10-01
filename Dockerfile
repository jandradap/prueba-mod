FROM alpine:latest
MAINTAINER Alejandro Morales Gracia "ale95mogra@gmail.com"

RUN apk --no-cache update
RUN apk add --no-cache apache2

ENV APACHE_RUN_USER     www-data
ENV APACHE_RUN_GROUP    www-data

RUN mkdir /runtest/apache2/
RUN mv /run/apache2/httpd.pid /runtest/apache2/
RUN chown -R www-data:www-data /runtest

ENV APACHE_LOG_DIR      /var/log/apache2
ENV APACHE_PID_FILE     /runtest/apache2/httpd.pid 

ADD httpd.conf /etc/apache2/httpd.conf

EXPOSE 80

CMD ["-D","FOREGROUND"]

ENTRYPOINT ["/usr/sbin/httpd"]
