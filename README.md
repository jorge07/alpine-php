# Alpine PHP
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-4-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

[![PR checks](https://github.com/jorge07/alpine-php/actions/workflows/pr.yaml/badge.svg?branch=master)](https://github.com/jorge07/alpine-php/actions/workflows/pr.yaml)
![Docker Pulls](https://img.shields.io/docker/pulls/jorge07/alpine-php.svg?style=flat-square)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-jorge07%2Falpine--php-blue)](https://hub.docker.com/r/jorge07/alpine-php)
[![GHCR](https://img.shields.io/badge/GHCR-ghcr.io%2Fjorge07%2Falpine--php-blue)](https://ghcr.io/jorge07/alpine-php)

Lightweight PHP-FPM Docker images based on Alpine Linux — under 40MB.

Kept up to date with [active PHP releases](https://www.php.net/supported-versions.php). Weekly automated rebuilds pick up Alpine security patches.

---

## Images

| Tag | PHP | Alpine | Arch |
|---|---|---|---|
| `8.4` / `8.4-dev` | 8.4.x | edge | amd64, arm64, arm/v7, arm/v8 |
| `8.3` / `8.3-dev` | 8.3.x | 3.20 | amd64, arm64, arm/v7, arm/v8 |
| `8.2` / `8.2-dev` | 8.2.x | 3.21 | amd64, arm64, arm/v7, arm/v8 |
| `8.1` / `8.1-dev` | 8.1.x | 3.19 | amd64, arm64, arm/v7, arm/v8 |

Available on [Docker Hub](https://hub.docker.com/r/jorge07/alpine-php) and [GHCR](https://ghcr.io/jorge07/alpine-php).

### Deprecated (available but unmaintained)

`8.0` · `7.4` · `7.3` · `7.2` · `7.1` · `5.6`

---

## Quick start

```sh
# Production image — PHP-FPM on port 9000
docker run -d --name php -p 9000:9000 -v $PWD:/app jorge07/alpine-php:8.3

# Dev image — PHP-FPM + Xdebug + Composer + SSH
docker run -d --name php-dev \
  -p 2244:22 \
  -p 9003:9003 \
  -v $PWD:/app \
  jorge07/alpine-php:8.3-dev
```

---

## Dev Container (VS Code)

The repo ships a `.devcontainer/devcontainer.json` for use with [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) or [GitHub Codespaces](https://github.com/features/codespaces).

### Get started in 3 steps

1. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) in VS Code
2. Open your project folder
3. Click **Reopen in Container** (or run `Dev Containers: Reopen in Container` from the command palette)

VS Code will pull `jorge07/alpine-php:8.3-dev`, mount your project at `/app`, and pre-install:
- [PHP Debug](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug) (Xdebug 3 integration)
- [Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client) (PHP language server)

### Xdebug launch config

Add `.vscode/launch.json` to your project:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/app": "${workspaceFolder}"
            }
        }
    ]
}
```

Set breakpoints, press **F5**, and trigger a request. For CLI scripts:

```sh
docker exec php-dev sh -c "XDEBUG_SESSION=1 php /app/script.php"
```

---

## Dev images — manual setup

Dev images add Xdebug, Composer, SSH, and Supervisor on top of the production image.

### PHPStorm (SSH remote interpreter)

```sh
docker run -d --name php-dev -p 2244:22 -p 9003:9003 -v $PWD:/app jorge07/alpine-php:8.3-dev
```

**Languages & Frameworks → PHP → Add → SSH Credentials**

| Field | Value |
|---|---|
| Host | `localhost` |
| Port | `2244` |
| User | `root` |
| Password | `root` |
| PHP executable | `/usr/bin/php` |

**Path mappings:** `<project root>` → `/app`

**Debug → Xdebug port:** `9003`

### Custom SSH credentials

```sh
docker build \
  --build-arg USER=myuser \
  --build-arg PASSWORD=mypass \
  --target dev -t myapp:dev \
  -f 8.3/Dockerfile 8.3/
```

### Xdebug 3 — key settings

| Setting | Value |
|---|---|
| Port | `9003` (changed from 9000 in Xdebug 2) |
| Trigger | `XDEBUG_SESSION=1` env var |
| Mode | `debug` (set in image, trigger-based) |

> **Migrating from Xdebug 2?** See the [IDE integration guide](doc/IDE.md) for a full comparison table and PHPStorm setup walkthrough.

---

## PHP Extensions

All images include:

`bcmath` · `ctype` · `curl` · `dom` · `exif` · `fileinfo` · `gd` · `iconv` · `intl` · `mbstring` · `opcache` · `openssl` · `pcntl` · `pdo` · `pdo_mysql` · `pdo_pgsql` · `phar` · `session` · `simplexml` · `sodium` · `tokenizer` · `xml` · `xmlreader` · `xsl` · `zip` · `zlib` · `apcu`

Dev images additionally include: `xdebug` · `pear`

---

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
