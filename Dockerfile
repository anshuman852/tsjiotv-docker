FROM ubuntu:latest AS build
WORKDIR /app
RUN apt-get update && apt-get install -y curl wget unzip
RUN wget https://github.com/mitthu786/TS-JioTV/blob/main/tsjiotv.zip?raw=true -O tsjiotv.zip && \
    unzip tsjiotv.zip && \
    rm tsjiotv.zip
FROM php:7.4.30-apache-buster
COPY --from=build /app /var/www/html
COPY .htaccess /var/www/html
WORKDIR /var/www/html
RUN sed -i 's/\/tsjiotv//g' /var/www/html/playlist.php && sed -i 's/assets/assets\/data/g' /var/www/html/login2.php
RUN chmod -R 777 /var/www/html