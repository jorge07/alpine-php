# Alpine PHP 
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-4-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Repository of https://hub.docker.com/r/jorge07/alpine-php

[![PR checks](https://github.com/jorge07/alpine-php/actions/workflows/pr.yaml/badge.svg?branch=master)](https://github.com/jorge07/alpine-php/actions/workflows/pr.yaml) ![Docker Pulls](https://img.shields.io/docker/pulls/jorge07/alpine-php.svg?style=flat-square)

Minimal PHP Docker images based on Alpine. Contains **tags** for development environments and adapted for various frameworks like [Symfony](http://symfony.com/) and [Wordpress](https://github.com/WordPress/WordPress).

## Documentation

[Read about Documentation and see some examples here](https://github.com/jorge07/alpine-php/tree/master/doc/README.md)

## Images

- [8.2](https://github.com/jorge07/alpine-php/blob/master/8.2/Dockerfile)
- [8.1](https://github.com/jorge07/alpine-php/blob/master/8.1/Dockerfile)
- [8.0](https://github.com/jorge07/alpine-php/blob/master/8.0/Dockerfile)

# Deprecated but available images

- [7.4](https://github.com/jorge07/alpine-php/blob/master/7.4/Dockerfile)
- [7.3](https://github.com/jorge07/alpine-php/blob/master/7.3/Dockerfile)
- [7.2](https://github.com/jorge07/alpine-php/blob/master/7.2/Dockerfile)
- [7.1](https://github.com/jorge07/alpine-php/blob/master/7.1/Dockerfile)
- [5.6](https://github.com/jorge07/alpine-php/blob/master/5.6/Dockerfile)

## Usage:

```sh
docker run -d --name dev -p 2323:22 -v $PWD:/app jorge07/alpine-php:8.2-dev
```

> To make xdebug config easier for all environments there's a custom ENVVAR you can define: `XDEBUG_CLIENT_HOST`. 
> Example: XDEBUG_CLIENT_HOST=docker.for.mac for OSX, XDEBUG_CLIENT_HOST=docker.for.windows for Windows users and Linux users and Remote interpreters by SSH can leave it empty.

> SSH is only for IDE integration to use container as remote interpreter 

## Dev Dockerfiles

Dev images extend the standard ones and add some tools for development and CI like, composer, xdebug, etc...

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/cv65kr"><img src="https://avatars0.githubusercontent.com/u/9404962?v=4" width="100px;" alt=""/><br /><sub><b>Kajetan</b></sub></a><br /><a href="https://github.com/jorge07/alpine-php/commits?author=cv65kr" title="Code">💻</a></td>
    <td align="center"><a href="http://tacon.eu"><img src="https://avatars2.githubusercontent.com/u/2017676?v=4" width="100px;" alt=""/><br /><sub><b>Luis</b></sub></a><br /><a href="https://github.com/jorge07/alpine-php/commits?author=Lutacon" title="Code">💻</a></td>
    <td align="center"><a href="https://coderslab.pl"><img src="https://avatars0.githubusercontent.com/u/2781079?v=4" width="100px;" alt=""/><br /><sub><b>Krzysztof Kowalski</b></sub></a><br /><a href="https://github.com/jorge07/alpine-php/commits?author=kowalk" title="Code">💻</a></td>
    <td align="center"><a href="https://ismaelbenitez.es"><img src="https://avatars1.githubusercontent.com/u/5638973?v=4" width="100px;" alt=""/><br /><sub><b>Ismael</b></sub></a><br /><a href="https://github.com/jorge07/alpine-php/commits?author=ismael-benitez" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
