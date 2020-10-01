FROM alpine:latest
MAINTAINER Alejandro Morales Gracia "ale95mogra@gmail.com"

RUN apk --no-cache update
RUN apk add --no-cache apache2

#RUN mkdir /run/apache2/
#RUN usermod -u 1000 apache
#RUN groupmod -g 1000 apache

ADD httpd.conf /etc/apache2/httpd.conf

EXPOSE 80

CMD ["-D","FOREGROUND"]

ENTRYPOINT ["/usr/sbin/httpd"]
