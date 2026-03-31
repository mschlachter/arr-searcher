#!/bin/bash
# Script copied from https://gist.github.com/rabidpug/a023ce2b62c4df806671ad19c105f835

__help() {
  cat << EOF
  Please call this script with \$ARR_API_KEY set, and with the following parameters:
  $0 sonarr|radarr|lidarr|readarr https://domain:port cutoff|missing
EOF
exit 1
}
if [[ -z "$ARR_API_KEY" ]] || [[ -z "$1" ]] || [[ -z "$2" ]] || [[ -z "$3" ]]; then
  __help
fi
case $1 in
  radarr)
    api=v3
    sortPart=movie
    commandPart=Movies
    ;;
  sonarr)
    api=v3
    sortPart=episode
    commandPart=Episode
    ;;
  lidarr)
    api=v1
    sortPart=album
    commandPart=Album
    ;;
  readarr)
    api=v1
    sortPart=book
    commandPart=Book
    ;;
  *)
    __help
    ;;
esac

curl -fsSL \
  -H "X-Api-Key: $ARR_API_KEY" \
  -H 'Content-Type: application/json' \
  -X POST \
  -d "$(curl -fsSL \
    -H "X-Api-Key: $ARR_API_KEY" \
    "$2/api/$api/wanted/$3?page=1&pageSize=20&sortDirection=ascending&sortKey=${sortPart}s.lastSearchTime&monitored=true" \
    | jq -rc --arg name "${commandPart}Search" --arg key "${sortPart}Ids" '{name: $name, $key: [.records[].id]}' \
  )" "$2/api/$api/command"

# Extra newlines for nicer output
echo; echo
