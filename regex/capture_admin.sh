#!/usr/bin/env bash


#url="https://www.heise.de/newsticker"

#if [[ "$url" =~ ^https?://([^/]+) ]]; then
#    domain=${BASH_REMATCH[1]}
#    echo "Domain name: $domain"
#else
#    echo "Invalid URL"
#fi

fn="Bildschirmfoto 2025-12-02 um 10.05.36.png"
fn="screenshot 2025-12-02 um 10.05.36.png"

regex="([[:alnum:]]+)[[:space:]]+([0-9]{4})-([0-9]{2})-([0-9]{2})"

if [[ "$fn" =~ $regex ]] ; then
    designator=${BASH_REMATCH[1]}
    year=${BASH_REMATCH[2]}
    month=${BASH_REMATCH[3]}
    day=${BASH_REMATCH[4]}
    printf "%s => %s-%s-%s\n" "$designator" $year $month $day
else
   echo "File name doesn't contain data"
fi
