#!/bin/bash -eu

# Copyright 2013-2015 Apcera Inc. All rights reserved.

tmp_keytab_file="/tmp/keytab$(date +%s)"

# HTTP/tasty
#echo "BQIAAABHAAIACUFQU0FSQS5JTwAESFRUUAAFdGFzdHkAAAABAAAAAAMAEgAg1wBAGJBWc122iNwyNJOtbWq8OIhoS2NzCv9PKfLkFnQ=" | base64 --decode >$tmp_keytab_file 

# HTTP/auth.vagrant.apcera.net:8080
#echo "BQIAAABeAAIACUFQU0FSQS5JTwAESFRUUAAcYXV0aC52YWdyYW50LmFwY2VyYS5uZXQ6ODA4MAAAAAEAAAAABwASACBnT/cc499ACK1ZBPnsyMCCoZ/CgTAtPiaDMjrucBNIww==" | base64 --decode >$tmp_keytab_file

# HTTP/auth.vagrant.apcera.net
echo "BQIAAABZAAIACUFQU0FSQS5JTwAESFRUUAAXYXV0aC52YWdyYW50LmFwY2VyYS5uZXQAAAABAAAAAAYAEgAgpNbcumxq1S4XrukaH1weNmzplWYzHitAtK+WDH4TWNM=" | base64 --decode >$tmp_keytab_file
REUSE_DOCKER_IMAGES="" \
SERVICE_LOG_FILTER="" \
SERVICE_NAME="HTTP/auth.vagrant.apcera.net" \
EXT_KDC_HOST="ad1.apsara.io" \
EXT_KDC_PORT="88" \
KEYTAB_FILE="$tmp_keytab_file" \
REALM_NAME="APSARA.IO" \
DOMAIN_NAME="apcera.net" \
USER_NAME="systemtest" \
USER_PASSWORD="P@ssword!" \
CLIENT_IN_CONTAINER="1" \
        ./run.sh

rm $tmp_keytab_file
