# Apld Certbot

A docker container for creating and renewing lets encrypt certs using certbot.

## Development

### Build
* `docker build -t certbot -f cert/Dockerfile cert/`

### Tag/Push
* `docker tag certbot apld/certbot && docker push apld/certbot`

## Usage
* Mount host cert storage to /etc/letsencrypt
* Mount host domain public directory to /webroot
* Mount log directory [OPTIONAL]

### Add new cert
```
docker run -ti \
-v /var/www/certs/:/etc/letsencrypt/ \
-v /var/www/<domain>/public:/webroot/ \
-v /var/log/letsencrypt/:/var/log/letsencrypt/ \
apld/certbot \
add <domain> <email>
```

### Renew
```
docker run -ti \
-v /var/www/certs/:/etc/letsencrypt/ \
-v /var/www/<domain>/public:/webroot/ \
-v /var/log/letsencrypt/:/var/log/letsencrypt/ \
apld/certbot \
renew <domain>
```

### Info
```
docker run -ti \
-v /var/www/certs/:/etc/letsencrypt/ \
apld/certbot \
info
```

## Install on Remote
* install docker
* `sudo nano /usr/bin/certbot`
  * copy in certbot bash file (make any required changes)
* `crontab -e`
  * `0 0 * * * certbot renew all`
  * `0 1 * * * service apache2 restart`
