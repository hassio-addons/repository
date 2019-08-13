#!/usr/bin/with-contenv bashio
#=======================================#
#                                       #
#      Sync Hass.io Backups to S3.      #
#                                       #
#=======================================#

# AWS Credentials
export AWS_ACCESS_KEY_ID=$(bashio::config 'aws_access_key')
export AWS_SECRET_ACCESS_KEY=$(bashio::config 'aws_secret_key')

# Bucket to Sync to 
BUCKET=$(bashio::config 'aws_s3_bucket')

bashio::log.debug "Find Backup Directory"
bashio::log.debug "Found: $(cd / && find . -type d -name 'backup')"

# Run our Sync Command -- We should make sure that we can
# Error if no internet or something
bashio::log.debug "Running command: aws s3 sync /backup/ s3://$BUCKET/"
# This is extremely noise in the logs. Also, maybe only get the most recent?
aws s3 sync /backup/ s3://$BUCKET/ --only-show-errors

bashio::log.info "Move Complete"
bashio::log.info "Bucket Contents: $(aws s3 ls s3://$BUCKET)"

