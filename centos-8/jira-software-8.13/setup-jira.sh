#!/bin/sh

yum -y install expect
yum -y install fontconfig

# install JIRA
JIRA_BIN=atlassian-jira-software-8.13.7-x64.bin
wget -nv --no-check-certificate https://www.atlassian.com/software/jira/downloads/binary/$JIRA_BIN
chmod +x $JIRA_BIN

DIR=$PWD

expect -c "
set timeout -1
spawn $DIR/$JIRA_BIN
expect \"OK\"
send \"o\n\"
expect \"Express Install\"
send \"1\n\"
expect \"Exit\"
send \"i\n\"
expect \"Yes\"
send \"y\n\"
expect \"Finishing installation\"
interact
"
# DO NOT insert any entry below.
# expect script exits unexpectedly.
