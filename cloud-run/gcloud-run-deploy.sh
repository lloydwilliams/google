#!/bin/sh
source ./set-env.sh

export APP_NAME=payroll-gcp
export PROJECT_NAME=$GOOGLE_PROJECT_ID
export IMAGE_NAME=docker.io/lloydwilliams/payroll-gcp:latest
#gcr.io/YOUR_PROJECT/APP_NAME

gcloud run deploy $APP_NAME --image=$IMAGE_NAME \
  --port=8080 \
  --update-env-vars=DD_API_KEY=$DD_API_KEY \
  --update-env-vars=DD_TRACE_ENABLED=true \
  --update-env-vars=DD_SITE='datadoghq.com' \
  --allow-unauthenticated