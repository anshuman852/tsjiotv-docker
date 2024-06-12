FROM alpine as build
RUN apk add wget unzip
RUN wget -O /tmp/TS-JioTV.zip https://tsnehcors.mitthu.workers.dev/?https://github.com/mitthu786/TS-JioTV/blob/main/TS-JioTV.zip?raw=true
RUN unzip /tmp/TS-JioTV.zip -d /tmp/
RUN rm /tmp/TS-JioTV.zip

FROM php:7.4.30-apache-buster
COPY --from=build /tmp/ /var/www/html/TS-JioTV/
RUN chown -R www-data:www-data /var/www/html/TS-JioTV/

EXPOSE 80
