#!/bin/bash

# kafka-manager
cd /opt/pnda

rm -r kafka-manager-1.3.3.6 >/dev/null 2>&1

wget https://github.com/yahoo/kafka-manager/archive/1.3.3.6.tar.gz
tar xzf 1.3.3.6.tar.gz

# remove the archive
rm 1.3.3.6.tar.gz
cd kafka-manager-1.3.3.6
sed -i 's/kafka-manager-zookeeper/127.0.0.1/' conf/application.conf
./sbt clean dist
unzip target/universal/kafka-manager-1.3.3.6.zip

# kafka-manager upstart
cp $1/scripts/files/kafka-manager.conf /etc/init/

# start kafka-manager and wait for 10 seconds
sudo service kafka-manager start && sleep 10