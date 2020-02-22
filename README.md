# CTFHub Web类环境demo


## 基础镜像

根据需要的环境，修改`Dockerfile`中的`from`，以便于使用对应的基础环境


## 源码

源码放置在src目录下。环境启动时候会自动进行拷贝至`/var/www/html`


## 配置

如对环境有特殊需求配置，请将环境配置放置在`_files/000-default.conf`中，并在Dockerfile中`COPY`至`/etc/apache2/sites-available/000-default.conf`

## 扩展

如对扩展有特殊需求，请使用`docker-php-ext-install` 安装扩展

```shell
docker-php-ext-install php-mysql
```

如扩展为自行编写，请自行按照php中的配置加载设置进行配置


## flag

flag为环境变量`FLAG`传入，测试时可在`docker-compose.yml`中配置一个，
在`_files/flag.sh`编写flag放置过程，根据题目考点将flag放置在对应位置，最后将flag.sh自删除

```shell
#!/bin/bash

# 文件类
echo "<?php // $FLAG" > /var/www/html/flag_is_here/flag_$RANDOM$RANDOM$RANDOM.php

# 数据库类

mysql -e "USE sqli; CREATE TABLE IF NOT EXISTS \`flag\` (\`flag\` varchar(100) NOT NULL) DEFAULT CHARSET=utf8;INSERT INTO \`flag\` VALUES ('$FLAG');" -uroot -proot

# 删除flag设置脚本
export FLAG=not_flag
FLAG=not_flag
rm -f /flag.sh
```
