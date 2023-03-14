#!/bin/sh
# source ./set-env.sh

export APP_NAME=payroll-gcp
export PROJECT_NAME=$GOOGLE_PROJECT_ID
#export IMAGE_NAME=docker.io/lloydwilliams/payroll-gcp:latest
#gcr.io/YOUR_PROJECT/APP_NAME

gcloud run services describe payroll-gcp --format 'value(status.url)'