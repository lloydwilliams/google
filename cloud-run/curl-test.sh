#!/bin/sh
source ./set-env.sh

# https://cloud.google.com/run/docs/triggering/https-request
echo $SERVICE_URL

curl -H "Authorization: Bearer $(gcloud auth print-identity-token)" $SERVICE_URL