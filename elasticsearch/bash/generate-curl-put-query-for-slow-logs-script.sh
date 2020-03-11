#!/bin/bash

# INDICES=$(curl --silent "http://localhost:9200/_cat/indices?h=index")

#!/bin/bash

idx=0;
for INDEX in $(cat ./indices); do
idx=$(( ${idx} + 1 ))

echo "# ${idx}. ${INDEX}"
echo ""
echo "curl -X PUT 'localhost:9200/${INDEX}/_settings?pretty' -H 'Content-Type: application/json' -d'"
echo "{"
echo "test"
echo "}"
echo "'"
echo ""
done >_update-slow-query-at-index.sh