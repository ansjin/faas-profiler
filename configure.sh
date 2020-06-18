# This script sets some universal parameters.
# It should be run oly once.

# Installing some dependencies if needed
sudo apt-get update
sudo apt-get install -y moreutils python3-pip linux-tools-`uname -r` blktrace intel-cmt-cat
sudo pip3 install -r requirements.txt

# Configure path variables used by the platform 
ROOTLINE='FAAS_ROOT="'$(echo $PWD)'"'
echo $ROOTLINE >> GenConfigs.py
echo 'WSK_PATH = "'$(which wsk)'"' >> GenConfigs.py

# Configure root path
echo $ROOTLINE | cat - invocation-scripts/monitoring.sh | sponge invocation-scripts/monitoring.sh
echo $ROOTLINE | cat - monitoring/RuntimeMonitoring.sh | sponge monitoring/RuntimeMonitoring.sh

# Make local directories
mkdir logs
mkdir data_archive
