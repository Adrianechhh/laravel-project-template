FROM php:8.0.28-fpm

ARG GIT_USER
ARG GIT_EMAIL
ARG PROJECT_TIMEZONE

ENV TIMEZONE=${PROJECT_TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo ${TIMEZONE} > /etc/timezone \
    && printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini

RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    rm nodesource_setup.sh

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libzip-dev \
		git \
        nodejs  \
        supervisor \
        p7zip-full \
        && docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd

RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

RUN npm install npm -g

RUN docker-php-ext-install pdo_mysql pdo zip sockets pcntl

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

COPY ./php.ini /usr/local/etc/php/
COPY ./supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN service supervisor start

RUN git config --global user.name $GIT_USER && \
    git config --global user.email $GIT_EMAIL && \
    git config --global --add safe.directory /app && \
    git config --global pull.rebase false


COPY --from=composer:2.2.0 /usr/bin/composer /usr/bin/composer

RUN curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
COPY bashrc /root/.bashrc
COPY run.sh /tmp/

WORKDIR /app
