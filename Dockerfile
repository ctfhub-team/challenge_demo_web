FROM ctfhub/base_web_httpd

COPY _files/flag.sh /flag.sh
COPY src /var/www/html
