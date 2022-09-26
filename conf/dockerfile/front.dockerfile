###
#
# Symsony WEB PHP/Apache Image - DEV
#
###

# Official Ubuntu 22.04 LTS
FROM ubuntu:22.04

LABEL maintainer="Symfony"

# Env var for all the script should be here
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV TZ=Europe/Paris


# Only port 80 for a local engine
EXPOSE 80
# Working dir, cannot be changed
WORKDIR /app

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq && \
    apt-get install -qy \
    sudo \
    tzdata

#Setup Europe/Paris
RUN sudo dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -qy \
    software-properties-common
RUN add-apt-repository ppa:ondrej/php

# apt-get install php-pear -qy && \

RUN apt-get update -qq && \
    apt-get install -qy \
    php8.1-cli php8.1 php8.1-mbstring libpcre3-dev php8.1-dev php8.1-mysql php8.1-gd php8.1-curl php8.1-zip php8.1-xml php8.1-opcache php8.1-intl

#Install awscli
#RUN apt-get install -qy awscli

RUN cd /usr/src
RUN pecl install apcu


# Install package git, unzip & zip are for composer
RUN apt-get update -qq && \
    apt-get install -qy \
    git \
    nano \
    gnupg \
    unzip \
    libonig-dev \
    libxml2-dev \
    zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN sudo useradd symfony --home /home/symfony/ --create-home

RUN mkdir /home/logs
RUN mkdir -p /home/symfo/public
#RUN mkdir -p /home/tools/scripts

RUN > /home/logs/php_error_log
RUN sudo chmod 755 /home/logs/php_error_log
#RUN sudo chown -R symfony. /home/symfo
#RUN sudo chown -R symfony. /home/tools

COPY conf/php/php.ini /etc/php/8.1/cli/php.ini

# Webpack
RUN sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt -y install nodejs
RUN npm i

#Symfony Cli
RUN sudo curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash -
RUN sudo apt -y install symfony-cli

