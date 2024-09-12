
# Prereqs 

## Docker login 

load env vars, should be stored in a file ~/.env 

docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

## Static files

## website 

static files must be stored in 

`/app/portfolio/static/`

**Ensure permissions are set to read for all contained files**

The container will look for ssl files here
`etc/letsencrypt`
**Ensure permissions are set to read only for nginx**

## email python app 

Email also uses an environments vars file. 
create a .env file inside this dir:
`/app/email/env/`
inside the .env, we expect:

Without these, SMPTlib will be unable to log into Gmail. 
```sh
EMAIL_USER=""
EMAIL_PASSWORD=""
```

# TODO 

- Create automatic pipeline to push new docker image on successful master build 
- Write tests

# Renewing Certs 

stop docker container, as it's occupying port 80

```sh
docker-compose down
```
run certbot as root for domain:
```sh
sudo certbot certonly --standalone -d benkalmus.com
```

## TODO: automating renewal 

add cron job to VPS to run a simple bash script

note: this is incomplete
0 0,12 * * * /usr/bin/certbot renew --deploy-hook "docker-compose restart"

