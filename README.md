## Certbot

## Usage

* Mount host cert storage to /etc/letsencrypt
* Mount host domain public directory to /webroot

### Add new cert

```
docker run -ti \
-v /var/www/certs/:/etc/letsencrypt/ \
-v /var/www/<domain>/public:/webroot/ \
apld/certbot \
add <domain> <email>
```

### Renew

```
docker run -ti \
-v /var/www/certs/:/etc/letsencrypt/ \
-v /var/www/<domain>/public:/webroot/ \
apld/certbot \
renew <domain>
```
