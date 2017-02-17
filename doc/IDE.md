# IDE integration

Use the **debuger** with PHPStorm (or whatever IDE) via **[remote connexion via SSH Credentials](https://confluence.jetbrains.com/display/PhpStorm/Working+with+Remote+PHP+Interpreters+in+PhpStorm)**:

### PHPSTORM

- Languages & Frameworks > PHP > Add > Remote...
    - SSH Credentials
        - HOST
            - Docker-machine: 192.168.99.100 ([Recommended](https://github.com/adlogix/docker-machine-nfs))
            - Linux or Docker4{MAc|Windows}: localhost
        - port: 2244
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

#### Steps in detail

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
