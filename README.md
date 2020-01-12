# EDM-server-setup

## About
This is the set up repo for EDM data engineering cloud only development environment

## Architecture: 
+ the environment spins up a __pgadmin, code-server, jupyterlab, postgis__ using docker compose
+ we then use nginx reverse proxy and certbot to serve these services under our domain (with ssl enabled)
+ files are synced among server bare metal, code-server, and jupyterlab
+ code-server and jupyterlab have docker socket mounted, and docker-cli installed, so users can develope containerized workflows within these browser based IDE as if it's running on baremetal
+ pgadmin serves as a GUI for postgres databases, we love using it because it's the only GUI that has mapping support for geometries

## Instructions: 
+ provision a docker droplet on digitalocean
+ ssh into the droplet and git pull this repo
+ run the following commands in order (under __root__): 
    + `./01_create-user.sh`
    + `./02_install-nginx.sh`
    + `./03_compose.sh`