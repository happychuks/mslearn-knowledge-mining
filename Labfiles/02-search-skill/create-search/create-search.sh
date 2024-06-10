#!/bin/bash

# Set values for your Search service
url="https://ai102srch387193407.search.windows.net"
admin_key="PuclF63xQ5lfHXQC2L5hYnj8Ez2A23KSQf5WNL3ufaAzSeCdinCf"

echo -----
echo "Creating the data source..."
curl -X POST "${url}/datasources?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: ${admin_key}" \
  -d @data_source.json

echo -----
echo "Creating the skillset..."
curl -X PUT "${url}/skillsets/margies-custom-skillset?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: ${admin_key}" \
  -d @skillset.json

echo -----
echo "Creating the index..."
curl -X PUT "${url}/indexes/margies-custom-index?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: ${admin_key}" \
  -d @index.json

# Wait
sleep 3

echo -----
echo "Creating the indexer..."
curl -X PUT "${url}/indexers/margies-custom-indexer?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: ${admin_key}" \
  -d @indexer.json