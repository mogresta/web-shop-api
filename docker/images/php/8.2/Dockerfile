FROM php:8.2-fpm as base

ARG PHP_EXT_DIR=/usr/local/lib/php/extensions/no-debug-non-zts-20220829/
ARG PHP_CONF_DIR=/usr/local/etc/php/conf.d/

RUN apt-get update -yqq && apt-get install -y apt-utils openssh-client zip unzip openssl git vim nano optipng

FROM base as composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.5.5

FROM base as dependencies
RUN apt-get update -y && apt-get install -y \
  libicu-dev
RUN apt-get install -y libzip-dev libpng-dev libjpeg-dev libfreetype6-dev libxslt-dev libwebp-dev
RUN apt-get install -y libmagickwand-dev --no-install-recommends

FROM base as runtime_dependencies
RUN apt-get install -y libjpeg62-turbo libpng16-16 webp libfreetype6 libxslt1-dev libzip4 \
    libmagickwand-6.q16-6 libfontconfig1 libxrender1 \
&& apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM dependencies as xdebug
RUN pecl install xdebug-3.2.0  && docker-php-ext-enable xdebug

FROM dependencies as imagick
RUN pecl install imagick && docker-php-ext-enable imagick

FROM dependencies as apcu
RUN pecl install apcu

FROM dependencies as zip
RUN docker-php-ext-configure zip --with-zip && docker-php-ext-install zip

FROM dependencies as gd
RUN docker-php-ext-configure gd --enable-gd --with-webp --with-jpeg \
--with-freetype \
&& docker-php-ext-install gd

FROM dependencies as pdo
RUN docker-php-ext-install pdo pdo_mysql

FROM dependencies as bcmath
RUN docker-php-ext-install bcmath

FROM dependencies as sockets
RUN docker-php-ext-install sockets

FROM dependencies as opcache
RUN docker-php-ext-install opcache

FROM dependencies as mysqli
RUN docker-php-ext-install mysqli

FROM dependencies as xsl
RUN docker-php-ext-install xsl

FROM dependencies as soap
RUN docker-php-ext-install soap

FROM dependencies as intl
RUN docker-php-ext-configure intl && docker-php-ext-install intl

FROM runtime_dependencies as php_8_fpm

ARG HOST_USER_ID
ARG HOST_GROUP_ID

COPY --from=composer /usr/local/bin/composer /usr/local/bin

COPY --from=imagick ${PHP_EXT_DIR} ${PHP_EXT_DIR}
## ?
COPY --from=imagick /usr/local/include/php/ext/ /usr/local/include/php/ext/
COPY --from=imagick ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=gd ${PHP_EXT_DIR} ${PHP_EXT_DIR}
## ?
COPY --from=gd /usr/local/include/php/ext/ /usr/local/include/php/ext/
COPY --from=gd ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=zip ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=zip ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=apcu ${PHP_EXT_DIR} ${PHP_EXT_DIR}
## ?
COPY --from=apcu ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=pdo ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=pdo ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=bcmath ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=bcmath ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=sockets ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=sockets ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=opcache ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=opcache ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=mysqli ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=mysqli ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=xsl ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=xsl ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=xdebug ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=xdebug ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=soap ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=soap ${PHP_CONF_DIR} ${PHP_CONF_DIR}

COPY --from=intl ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from=intl ${PHP_CONF_DIR} ${PHP_CONF_DIR}

RUN set -xe && \
 addgroup --system --gid ${HOST_GROUP_ID} web && \
 adduser --system --shell /bin/bash --disabled-password -uid ${HOST_USER_ID} --gid ${HOST_GROUP_ID} web

COPY /docker/configuration/php/8.2/php8.2.ini /usr/local/etc/php/php.ini
COPY /docker/configuration/php/8.2/php8.2-fpm.conf /usr/local/etc/php-fpm-custom.conf
COPY /docker/configuration/php/8.2/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY /docker/configuration/ssh /home/web/.ssh

RUN chown -R web:web /var/www/html
RUN usermod -aG sudo web
USER web

EXPOSE 9000
