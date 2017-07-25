# Using Docker Compose

Minimal Configuration:

```YAML
version: '2'
services:
  fpm:
      image: jorge07/alpine-php:7-dev
      ports:
        - "2244:22"
        - "9000:9000"
      volumes:
        - "$PWD:/app"
```
You can optionally add ENV params:
```YAML

 ...
   fpm:
      environment:
        - PHP_IDE_CONFIG=serverName=SomeName
```
# Nginx integration

This example is based on a [Symfony](http://symfony.com/) project but can be what you want. Full example [here](https://github.com/jorge07/ddd-playground)

Project structure:

![Tree](https://raw.githubusercontent.com/jorge07/alpine-php/master/doc/images/folder-structure.png)

*etc/infrastructure/dev/nginx/demo.conf*

```nginx
server {
  server_name demo.dev www.demo.dev;
  root /app/web;

  location / {
     try_files $uri /app_dev.php$is_args$args;
  }

  location ~ ^/(app|app_dev|config)\.php(/|$) {

     fastcgi_pass fpm:9000;
     fastcgi_split_path_info ^(.+\.php)(/.*)$;
     include fastcgi_params;

     fastcgi_param  SCRIPT_FILENAME  $realpath_root$fastcgi_script_name;
     fastcgi_param DOCUMENT_ROOT $realpath_root;
  }
}
```

*etc/infrastructure/dev/nginx/Dockerfile*
```Dockerfile
 FROM nginx:1.11-alpine

 COPY demo.conf /etc/nginx/conf.d/default.conf
```
*/etc/infrastructure/dev/docker-compose.yml*
```YAML
 version: '2'
 services:
   nginx:
     build: nginx
     depends_on:
       - fpm
     ports:
       - "80:80"
     volumes:
       - "$PWD/web:/app/web"

   fpm:
     image: jorge07/alpine-php:7-dev
     ports:
       - "2244:22"
       - "9000:9000"
     volumes:
       - "$PWD:/app"
```
Up enviroment

     $ docker-compose -f /etc/infrastructure/dev/docker-compose.yml up -d
     
