#!/bin/bash
set -e
echo "this is running inside the container before Solr starts"

echo "Create hal_en_US"
mkdir –p /opt/solr/server/solr/configsets/hal_en_US
cp -rf /opt/solr/example/files/conf /opt/solr/server/solr/configsets/hal_en_US
 
#Create collection
cd /opt/solr/bin

./solr  create_collection -c collection name  -d  confiset path of collection which we created in configset steps –rf 2

./solr create_collection -c hal_en_US -d /opt/solr/server/solr/configsets/hal_en_US/conf -rf 2