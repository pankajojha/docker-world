
#RUNNING from outside container
# docker exec -it solr1 /bin/ssh

# create core (solrCloud)

##HAL- data
docker exec -it solr1 mkdir -p /opt/solr/server/solr/configsets/hal_en_US

docker exec -it solr1 solr create_collection -c hal_en_US -d /opt/solr/server/solr/configsets/hal_en_US/conf -rf 2

docker cp managed-schema solr1:/opt/solr/server/solr/configsets/hal_en_US/conf/managed-schema

docker cp solrconfig.xml solr1:/opt/solr/server/solr/configsets/hal_en_US/conf/solrconfig.xml

#docker exec -it solr cp -rf . 

# create core (non solrCloud)
docker exec -it solr1 bin/solr create_core -c hal_en_US




#import config
docker exec -it solr1 bin/post -c hal_en_US example/exampledocs/manufacturers.xml

docker exec -it solr1 cp -rf /opt/solr/example/files/conf /opt/solr/server/solr/configsets/hal_en_US /

#####################
cd /opt/solr/bin
