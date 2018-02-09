#!/bin/bash

set -eu

export SOURCE_GIT_URI=$1
export IMAGE_REPO=$2
export IMAGE_NAME=$3
export IMAGE_TAG=$4
export NAMESPACE=$5
export JOB_NAME=$6
export SOURCE_GIT_REF=${SOURCE_GIT_REF:-master}

envsubst < job.xml.template > job.xml

curl -s \
    -XPOST "https://${JENKINS_URL}/createItem?name=${JOB_NAME}" \
    -H 'Content-Type:text/xml' \
    -u "${JENKINS_USERNAME}:${JENKINS_TOKEN}" \
    --data-binary @job.xml
