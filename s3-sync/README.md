## About 
Simple Storage Service (S3) is an enterprise data storage solution from Amazon Web Services. This addon will requiore that you've already set up an Amazon S3 Bucket, as well as obtained access keys. 

### Access Keys
General guidelines on access key security can be found [here](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys). Instructions for obtaining access keys can be found [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey).

### S3 Bucket
An AWS S3 Bucket is needed to store backup files. Instructions on creating a bucket can be found [here](https://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html).
The keys used must have permissions to the S3 bucket where backups will be stored, this can be acheived with an [IAM Policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html) allowing access to the S3 Bucket.

## Config
```
{
  "log_level": "info",
  "aws_access_key": "akia...",
  "aws_secret_key": "",
  "aws_s3_bucket": "my-s3-bucket
}
```

### Config Options
log_level: Specify log level here, default is info, and available log types are trace, debug, info, notice, warning, error, fatal. At this time, only info and debug are used with this addon.
aws_access_key: AWS Access Key with permissions to the below bucket. Instructions for generating this key can be found above.
aws_secret_key: AWS Secret Key with permissions to the below bucket. Instructions for generating this key can be found above.
aws_s3_bucket: S3 Bucket to store backups.
