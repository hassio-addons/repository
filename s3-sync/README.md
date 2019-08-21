# Community Hass.io Add-ons: AWS S3 Sync

# About

This add-on allows you to automate backups to AWS S3, keeping them outside of 
your home network in case of a catastrophic failure.

This addon should not cause any harm to your system, there are no writes or
modifications made to your system. It will only sync what's local to the 
specified S3 Bucket.


## Features

This add-on will sync local backup files to the specified S3 bucket, and the
other way as well, from S3 to Local. Backups will not be deleted from the local
directory, and any backups that exist in S3 will be moved locally.

Because this is a sync, you could potentially move more backups from S3 to the
local drive than you have storage for. The AWS CLI will stop it from filling up
the drive, but be sure to remove old backups from S3 just to be on the safe
side.
