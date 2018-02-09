#!/bin/bash

set -eu

export JOB_NAME=$1
export JENKINS_HOSTNAME=$2

envsubst < job.xml.template > job.xml

curl -s \
    -XPOST "https://${JENKINS_HOSTNAME}/createItem?name=${JOB_NAME}" \
    -H 'Content-Type:text/xml' \
    -u "${JENKINS_USERNAME}:${JENKINS_TOKEN}" \
    --data-binary @job.xml
