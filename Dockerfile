FROM debian:latest
MAINTAINER sharaku

# update & inatall unzip wget
RUN apt-get -y update
RUN apt-get install -y wget gzip unzip

# ######################################################################
# add settings

ADD plugins-install.sh /opt/plugins-install.sh
ADD themes-install.sh /opt/themes-install.sh
ADD install.sh /opt/install.sh

# permission setting
RUN chmod -R 555 /opt/*

# ######################################################################
# Clear out the local repository of retrieved package files

# redmine data volume
VOLUME /home/redmine/data

# redmine data volume
ENV INSTALL_DIR /home/redmine/data

# start
CMD ["/opt/install.sh"]
