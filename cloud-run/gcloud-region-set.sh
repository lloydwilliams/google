#!/bin/sh
source ./set-env.sh

export APP_NAME=payroll-gcp
export REGION=$REGION

gcloud config set run/region $REGION