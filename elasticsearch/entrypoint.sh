#!/bin/bash

curl -XDELETE http://localhost:9200/_template/http?pretty=true

echo
echo "Deleted current http template..."

echo "Creating new http template..."
sleep 2

curl -XPUT http://localhost:9200/_template/http -d '
{
	"template" : "http*",
	"mappings" : {
   	"_default_" : {
  		"properties": {
  			"@timestamp": {"type": "date","format": "dateOptionalTime"},
  			"@version": {"type": "string"},
  			"date": {"type": "date"},
  			"event": {"type": "string","index": "not_analyzed"},
  			"eventId": {"type": "string", "index":"not_analyzed"},
  			"fingerprint": {"type": "string", "index": "not_analyzed"},
  			"lang": {"type": "string","index": "not_analyzed"},
  			"contenu": {"type": "string","index": "not_analyzed"},
  			"ctype": {"type": "string","index": "not_analyzed"},
  			"os": {"type": "string","index": "not_analyzed"},
  			"sessionId": {"type": "string", "index": "not_analyzed"},
  			"userId": {"type": "string","index": "not_analyzed"},
  			"url": {"type": "string", "index": "not_analyzed", "copy_to": "urlPath"},
        "urlPath": {"type": "string"},
        "geoip.location": {"type": "geo_point"},
        "geoip.country_name": {"type": "string","index": "not_analyzed"},
        "geoip.city_name": {"type": "string","index": "not_analyzed"},
        "geoip.real_region_name": {"type": "string","index": "not_analyzed"}
  		}
    }
  }
}
'
echo
echo "Done."

exec "$@"
