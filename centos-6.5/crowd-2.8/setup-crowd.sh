#!/bin/sh

# install OpenJDK jre
yum -y install java-1.7.0-openjdk

# install Crowd
CROWD_BIN=atlassian-crowd-2.8.3.tar.gz
wget -nv --no-check-certificate http://www.atlassian.com/software/crowd/downloads/binary/$CROWD_BIN

DIR=$PWD

# setup CROWD_INSTALL
mkdir -p /opt/atlassian
cd /opt/atlassian
tar xvfz $DIR/$CROWD_BIN
ln -s atlassian-crowd-2.8.3 crowd

# setup CROWD_HOME
mkdir -p /var/atlassian/application-data/crowd
echo "crowd.home=/var/atlassian/application-data/crowd" >> /opt/atlassian/crowd/crowd-webapp/WEB-INF/classes/crowd-init.properties

# start crowd
cd /opt/atlassian/crowd
./start_crowd.sh


