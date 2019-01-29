FROM alpine:3.8

RUN apk update
RUN apk add curl \
    nginx \
    sqlite \
    php5 \
    php5-curl \
    php5-iconv \
    php5-json \
    php5-dom \
    php5-fpm \
    php5-mcrypt \
    php5-openssl \
    php5-pdo \
    php5-zip \
    php5-sqlite3 \
    php5-pdo_sqlite \
    php5-gettext \
    php5-bz2 \
    php5-ctype
#RUN ln -s /usr/bin/php5 /usr/bin/php

RUN addgroup -S www && adduser -G www -S www
RUN mkdir /www && chown -R www:www /www

RUN mkdir /www/rainloop
WORKDIR /www/rainloop
RUN curl -sL https://repository.rainloop.net/installer.php | php5
RUN chown -R www:www /www/rainloop
RUN find . -type d -exec chmod 755 {} \;
RUN find . -type f -exec chmod 644 {} \;

COPY php5_env.sh /etc/profile.d
RUN chmod 755 /etc/profile.d/*
COPY reconfig_php5.sh /
RUN sh /reconfig_php5.sh && rm /reconfig_php5.sh
COPY --chown=www:www phpinfo.php /www

RUN chown -R www:www /var/lib/nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY --chown=www:www index.html /www/index.html
EXPOSE 80

CMD ["/bin/sh", "-c", "nginx && php-fpm5 && tail -f /var/log/nginx/access.log /var/log/nginx/error.log /var/log/php-fpm.log"]
