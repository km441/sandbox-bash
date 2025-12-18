#!/usr/bin/env bash

function getCreationDateFromFileName() {
    local fileName=$(basename "$1")
    local regex="([[:alnum:]]+)[[:space:]]+([0-9]{4})-([0-9]{2})-([0-9]{2}).*([0-9]{2}).([0-9]{2}).([0-9]{2}).png"
    
    if [[ "$fileName" =~ $regex ]] ; then
        local designator=${BASH_REMATCH[1]}
        local year=${BASH_REMATCH[2]}
        local month=${BASH_REMATCH[3]}
        local day=${BASH_REMATCH[4]}
        local hour=${BASH_REMATCH[5]}    
        local minute=${BASH_REMATCH[6]}    
        local second=${BASH_REMATCH[7]}    
    else
        return 1 
    fi

    printf "%s-%s-%sT%s:%s:%s %s\n" $year $month $day $hour $minute $second 
    return 0
}

function writeCreationDateToFile() {
    local defaultCrationTime="05:45:00"

    local fileName=$1
    local creationDate=$2
    local creationTime=${3:-${defaultCrationTime}}

    sips -s description "creation: ${creationDate} ${creationTime}"
    return 0
}

fn="Bildschirmfoto 2025-12-02 um 10.05.36.png"
fn="screenshot 2025-12-02 um 10.05.36.png"
fn="screen shot 2025-12-02 um 10.05.36.png"

getCreationDateFromFileName "$1"

printf "creation %s\n" ${creation}

writeCreationDateToFile "asdf.png" 1949-10-07
