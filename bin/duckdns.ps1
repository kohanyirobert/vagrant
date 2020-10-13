param(
  [parameter(position=0, mandatory=$true)][string]$subdomain,
  [parameter(position=1, mandatory=$true)][string]$ip,
  [parameter(position=2)][string]$token = $env:DUCKDNS_TOKEN
)
$url="https://www.duckdns.org/update?domains=$subdomain&token=$token&ip=$ip"
curl $url | Select-Object -ExpandProperty StatusDescription
