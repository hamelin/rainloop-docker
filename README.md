# Docker image for running the [Rainloop](https://www.rainloop.net/) web-based e-mail app

Rainloop is a web interface for ad hoc e-mail services provided over IMAP[S] and SMTP[S] access. These files build
up the Docker image stored at `hamelin/rainloop`, based on Alpine Linux and PHP. I have followed
[these instructions](https://wiki.alpinelinux.org/wiki/Nginx_with_PHP#Nginx_with_PHP5) to set up an Alpine Docker
with working PHP5; Rainloop is installed as is on top, in `/www/rainloop`.
