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
RUN ln -s /usr/bin/php5 /usr/bin/php

RUN curl -sL https://repository.rainloop.net/installer.php | php

CMD ["/bin/sh"]
