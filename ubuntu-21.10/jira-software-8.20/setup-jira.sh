#!/bin/sh

sudo apt update
sudo apt -y install expect
sudo apt -y install fontconfig

# install JIRA
JIRA_BIN=atlassian-jira-software-8.20.6-x64.bin
sudo wget -nv --no-check-certificate https://www.atlassian.com/software/jira/downloads/binary/$JIRA_BIN
sudo chmod +x $JIRA_BIN

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
