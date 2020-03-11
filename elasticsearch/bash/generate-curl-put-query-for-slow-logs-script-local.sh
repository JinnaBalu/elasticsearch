#!/bin/bash

INDICES=$(curl --silent "http://localhost:9200/_cat/indices?h=index")

for INDEX in $(cat ./indices-2); do
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
