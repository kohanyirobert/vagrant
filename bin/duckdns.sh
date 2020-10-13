#!/bin/bash -eu
subdomain="$1"
ip="$2"
token="${3:-$DUCKDNS_TOKEN}"
url="https://www.duckdns.org/update?domains=$subdomain&token=$token&ip=$ip"
curl -s $url