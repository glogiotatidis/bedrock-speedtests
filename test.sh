#!/bin/bash
set -xe
LOCATION=${LOCATION:-"Dulles_IE11"}
URL=${URL:-"https://www.mozilla.com/firefox/new"}
POLL=${POLL:-5}
TIMEOUT=${TIMEOUT:-360}

rm -rf results/*.xml

docker pull giorgos/webpagetest
docker run -v `pwd`:/src giorgos/bedrock-speedtests test $URL --key $KEY --location $LOCATION --poll $POLL --timeout $TIMEOUT --breakdown --pagespeed --runs 1 --first --reporter xunit --specs specs.json > results/${LOCATION}.xml
