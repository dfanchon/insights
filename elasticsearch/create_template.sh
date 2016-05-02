
curl -XDELETE http://localhost:9200/_template/http-*

echo
echo "Deleted current http template..."

echo "Creating new http template..."
sleep 2

curl -XPUT http://localhost:9200/_template/http -d '
{
	"template" : "http*",
  "settings":{
    "index":{
      "analysis":{
        "filter" : {
          "url_filter": {
            "type": "length",
            "min" : 3
          }
        },
        "analyzer":{
          "analyzer_url":{
            "type": "custom",
            "tokenizer": "standard",
            "filter":"url_filter"
          }
        }
      }
    }
  },
	"mappings" : {
   	"_default_" : {
  		"properties": {
  			"@timestamp": {"type": "date","format": "dateOptionalTime"},
  			"@version": {"type": "string"},
  			"date": {"type": "date"},
  			"event": {"type": "string","index": "not_analyzed"},
  			"eventId": {"type": "string", "index":"not_analyzed"},
				"eventLabel": {"type": "string", "index":"not_analyzed"},
  			"fingerprint": {"type": "string", "index": "not_analyzed"},
  			"lang": {"type": "string","index": "not_analyzed"},
  			"contenu": {"type": "string","index": "not_analyzed"},
  			"ctype": {"type": "string","index": "not_analyzed"},
  			"os": {"type": "string","index": "not_analyzed"},
				"referrer": {"type": "string","index": "not_analyzed"},
  			"sessionId": {"type": "string", "index": "not_analyzed"},
  			"userId": {"type": "string","index": "not_analyzed"},
  			"url": {"type": "string", "index": "not_analyzed", "copy_to": "urlPath"},
        "urlPath": {"type": "string", "analyzer":"analyzer_url"},
        "geoip": {
          "dynamic": true,
          "type": "object",
          "properties": {
            "ip": { "type": "ip", "doc_values": true },
            "latitude": { "type": "float", "doc_values": true },
            "location": { "type": "geo_point", "doc_values": true },
            "longitude": { "type": "float", "doc_values": true },
            "country_name": {"type": "string","index": "not_analyzed"},
            "city_name": {"type": "string","index": "not_analyzed"},
            "real_region_name": {"type": "string","index": "not_analyzed"}
          }
        }
  		}
    }
  }
}
'
echo
echo "Done."
