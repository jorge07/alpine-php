## Content table

|    Tag     | Parent     |        Content                                                                    |
|------------|------------|-----------------------------------------------------------------------------------|
| 7          | alpine     | tini, php7-cli & fpm                                                              |
| 7-dev      |   7        |  + SSH server, ant, composer                                                      |
| 7-front    | 7-dev      |   + node6 & npm3 & yarn                                                           |
| 5.6        | alpine     | tini, php5.6-cli & fpm                                                            |
| 5.6-dev    |  5.6       |  + SSH server, ant, composer                                                      |
| 7-dev-sf   | 7-dev      | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) |
| 7-front-sf | 7-dev-sf   | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) |
| 5.6-dev-sf | 5.6-dev    | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) |
| 7-wp       | 7          |                                                                                   |
| 7-dev-wp   | 7-dev      | + wp-cli, wp-autocompletion                                                       |
| 5.6-wp     | 5.6        |                                                                                   |
| 5.6-dev-wp | 5.6-dev    | + wp-cli, wp-autocompletion                                                       |

## 7 and 5.6 Schemas

![Tree](https://raw.githubusercontent.com/jorge07/alpine-php/master/doc/images/tree.png)