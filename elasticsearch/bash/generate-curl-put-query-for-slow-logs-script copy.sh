#!/bin/bash

INDICES=$(curl --silent "http://localhost:9200/_cat/indices?h=index")

for INDEX in $INDICES; do
echo "curl -XGET 'http://ip172-18-0-30-bkqn5n535dvg00e587jg-9200.direct.labs.play-with-docker.com//$INDEX?pretty' > $INDEX.json"
done >  settingsmappingsscript.sh


#!/bin/bash

INDICES=$(curl --silent "http://localhost:9200/_cat/indices?h=index")

for INDEX in $INDICES; do
cat <<EOF >>${INDEX}_r.sh
curl -X POST "localhost:9200/_reindex?wait_for_completion=true&pretty=true" -H 'Content-Type: application/json' -d'
{
  "source": {
    "index": "$INDEX"
  },
  "dest": {
    "index": "5_${INDEX}"
  }
}' >> ${INDEX}.txt
EOF
done


#!/bin/bash

INDICES=$(curl --silent "http://localhost:9200/_cat/indices?h=index")

for INDEX in $INDICES; do
cat <<EOF >>${INDEX}_r.sh
curl -X PUT "localhost:9200/{INDEX}/_settings?pretty" -H 'Content-Type: application/json' -d'
{
    "index.search.slowlog.threshold.query.warn": "10s",
    "index.search.slowlog.threshold.query.info": "5s",
    "index.search.slowlog.threshold.query.debug": "2s",
    "index.search.slowlog.threshold.query.trace": "500ms",
    "index.search.slowlog.threshold.fetch.warn": "1s",
    "index.search.slowlog.threshold.fetch.info": "800ms",
    "index.search.slowlog.threshold.fetch.debug": "500ms",
    "index.search.slowlog.threshold.fetch.trace": "200ms",
    "index.search.slowlog.level": "info"
}
'
 >> ${INDEX}.txt
EOF
done
