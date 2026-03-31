#!/bin/sh

while true; do
  if [ -n "${RADARR_URL}" ] && [ -n "${RADARR_API_KEY}" ]; then
    echo "Initiating search for Radarr"
    ARR_API_KEY=$RADARR_API_KEY . ./arr_search.sh radarr $RADARR_URL missing
  else
    echo "Skipping Radarr, not configured.."
  fi
  if [ -n "${SONARR_URL}" ] && [ -n "${SONARR_API_KEY}" ]; then
    echo "Initiating search for Sonarr"
    ARR_API_KEY=$SONARR_API_KEY . ./arr_search.sh sonarr $SONARR_URL missing
  else
    echo "Skipping Sonarr, not configured.."
  fi
  if [ -n "${LIDARR_URL}" ] && [ -n "${LIDARR_API_KEY}" ]; then
    echo "Initiating search for Lidarr"
    ARR_API_KEY=$LIDARR_API_KEY . ./arr_search.sh lidarr $LIDARR_URL missing
  else
    echo "Skipping Lidarr, not configured.."
  fi
  if [ -n "${READARR_URL}" ] && [ -n "${READARR_API_KEY}" ]; then
    echo "Initiating search for Readarr"
    ARR_API_KEY=$READARR_API_KEY . ./arr_search.sh readarr $READARR_URL missing
  else
    echo "Skipping Readarr, not configured.."
  fi

  echo "Waiting ${SLEEP_TIMER:-3600} seconds for next cycle..."
  sleep ${SLEEP_TIMER:-3600} # every hour by default
done
