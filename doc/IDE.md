# IDE integration

### Up container

Run this in your project root path: 
    
    docker run -itd --name php7 -v $PWD:/app -p 2244:22 jorge07/alpine-php:7.4-dev

- `-v $PWD:/app` will create a volume to share the host folder with the container
- `-p 2244:22` will export the 22 container port to the 2244 host machine. This will allow us to connect the IDE via SSH.

### PHPSTORM

- Languages & Frameworks > PHP > Add > Remote...
    - SSH Credentials
        - HOST
            - Docker-machine: 192.168.99.100 ([Recommended](https://github.com/adlogix/docker-machine-nfs))
            - Linux or Docker4{MAc|Windows}: localhost
        - port: 2244 (or the one you choose on the docker run command)
        - user: root
        - pass: root 
        - Executable: /usr/bin/php
    - Path mappings:
        - <Project root> -> /app
      
**Remote Interpreter**
![Remote](https://raw.githubusercontent.com/jorge07/alpine-php/master/doc/images/remote-interpreter.png)

**Mapping**
![Remote](https://raw.githubusercontent.com/jorge07/alpine-php/master/doc/images/mapping.png)

Now your breakpoints should work.

You can also use the oficial PHPStrom documentation for [remote connexion via SSH Credentials](https://confluence.jetbrains.com/display/PhpStorm/Working+with+Remote+PHP+Interpreters+in+PhpStorm) they will explain it better than me.

### Steps in detail

**Credentials**

Use the ARG variables to change the *USER* and *PASSWORD* for ssh and *COMPOSER_VERSION* to select an specific version on the build. 

**Default Credentials Values:**

- user: root 
- pass: root

**Binary path**

- /usr/bin/php

**Xdebug.so path**

- /usr/lib/php{7}/modules/xdebug.so

**Server mappings**

Add your **Path mapping** from your workspace folder to the `/app` folder inside the container.

**Xdebug**

If you want to [debug php script commands remotely](https://confluence.jetbrains.com/display/PhpStorm/Debugging+PHP+CLI+scripts+with+PhpStorm) (I.E: php bin/console something) with Your IDE (PHPStorm in this case):
 
 - Set the PHP_IDE_CONFIG environment variable with **serverName=SomeName**
 - where **SomeName** is the name of the server configured in *Settings / Preferences | Languages & Frameworks | PHP | Servers* in the PHPStorm IDE.
