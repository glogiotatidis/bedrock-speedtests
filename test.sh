#!/bin/bash
set -xe
LOCATION=${LOCATION:-"Dulles_IE11"}
URL=${URL:-"https://www.mozilla.com/firefox/new"}
POLL=${POLL:-5}
TIMEOUT=${TIMEOUT:360}

docker pull giorgos/webpagetest
docker run -v `pwd`:/src giorgos/bedrock-speedtests test $URL --key $KEY --location $LOCATION --poll $POLL --timeout $TIMEOUT --breakdown --pagespeed --reporter xunit --specs specs.json > results/results.xml