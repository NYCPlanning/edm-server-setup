FROM sptkl/datascience-notebook:latest

USER root

RUN sh -c "set -x
    VER=\"19.03.1\"
    curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz
    tar -xz -C /tmp -f /tmp/docker-$VER.tgz
    mv /tmp/docker/* /usr/bin"

RUN groupadd -g 999 docker\ 
    && usermod -aG docker jovyan
    
RUN deb http://apt.postgresql.org/pub/repos/apt/ YOUR_UBUNTU_VERSION_HERE-pgdg main\
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -


RUN apt-get update && apt-get install -y \
    curl\
    python3\
    python3-pip\
    postgresql-client-common\
    postgresql-client-11\
    postgis

USER jovyan
