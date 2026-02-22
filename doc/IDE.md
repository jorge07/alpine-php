# IDE Integration

## Start the dev container

Run this in your project root:

```sh
docker run -itd --name php-dev \
  -v $PWD:/app \
  -p 2244:22 \
  -p 9003:9003 \
  jorge07/alpine-php:8.3-dev
```

- `-v $PWD:/app` — mounts your project at `/app` inside the container
- `-p 2244:22` — SSH port for remote interpreter
- `-p 9003:9003` — Xdebug 3 port (default, replaces 9000 from Xdebug 2)

**Default credentials:** `root` / `root`

---

## VS Code (Dev Containers)

The repo ships a `.devcontainer/devcontainer.json`. Open the project in VS Code and click **Reopen in Container** — it will use `jorge07/alpine-php:8.3-dev` and pre-install the PHP Debug and Intelephense extensions.

### Xdebug launch config

Add to `.vscode/launch.json`:

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
        },
        {
            "name": "Debug CLI script",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/app": "${workspaceFolder}"
            },
            "runtimeExecutable": "php",
            "program": "${file}"
        }
    ]
}
```

Set the `XDEBUG_SESSION` env var or use the browser extension to trigger a debug session. For CLI scripts:

```sh
docker exec php-dev sh -c "XDEBUG_SESSION=1 php /app/bin/console something"
```

---

## PHPStorm

### Remote interpreter via SSH

**Languages & Frameworks → PHP → Add → SSH Credentials**

| Field | Value |
|---|---|
| Host | `localhost` (or your Docker host IP) |
| Port | `2244` |
| User | `root` |
| Password | `root` |
| PHP executable | `/usr/bin/php` |

**Path mappings:** `<project root>` → `/app`

### Xdebug 3 configuration

**Languages & Frameworks → PHP → Debug**

| Setting | Value |
|---|---|
| Debug port | `9003` |
| Can accept external connections | ✅ |

**Run → Edit Configurations → PHP Remote Debug**

| Setting | Value |
|---|---|
| Server | (the SSH server you configured above) |
| IDE key | `PHPSTORM` |

For CLI debugging, set the env var before running:

```sh
docker exec php-dev sh -c "PHP_IDE_CONFIG='serverName=MyServer' XDEBUG_SESSION=PHPSTORM php /app/script.php"
```

### Key differences from Xdebug 2

| | Xdebug 2 | Xdebug 3 |
|---|---|---|
| Default port | `9000` | `9003` |
| Trigger env var | `XDEBUG_REMOTE_ENABLE=1` | `XDEBUG_SESSION=1` |
| ini key (enable) | `xdebug.remote_enable=1` | `xdebug.mode=debug` |
| ini key (host) | `xdebug.remote_host` | `xdebug.client_host` |
| ini key (port) | `xdebug.remote_port` | `xdebug.client_port` |

The images ship with `xdebug.mode=debug` and `xdebug.start_with_request=trigger` — Xdebug only activates when a session is triggered, not on every request.

---

## SSH credentials (custom)

Pass build args to change the default user/password:

```sh
docker build \
  --build-arg USER=myuser \
  --build-arg PASSWORD=mypassword \
  -t myapp:dev \
  --target dev \
  -f 8.3/Dockerfile 8.3/
```
