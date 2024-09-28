FROM alpine:3.20
MAINTAINER kost - https://github.com/kost

RUN apk --no-cache --update add curl php83-apache2 php83-cli php83-session php83-json php83-phar php83-openssl php83-mbstring php83-iconv && rm -f /var/cache/apk/* && \
mkdir -p /run/apache2 && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
mkdir /app && chown -R apache:apache /app && \
sed -i 's#^DocumentRoot ".*#DocumentRoot "/app"#g' /etc/apache2/httpd.conf && \
sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
echo "Success"

ADD config/* /etc/apache2/conf.d/

ADD scripts/run.sh /scripts/run.sh
RUN mkdir /scripts/pre-exec.d && \
mkdir /scripts/pre-init.d && \
chmod -R 755 /scripts

EXPOSE 80

# VOLUME /app
WORKDIR /app

ENTRYPOINT ["/scripts/run.sh"]

