#!/bin/bash

archive_file_name="/tmp/sas-config-$(date +'%m%d%Y').tar.gz"
bucket_path="$(date +'%Y')/$(date +'%B')/"
bucket_name="presidio-sas-config-bucket"

tar -zcvf $archive_file_name /home/centos/test  > /dev/null 2>&1

if [ -f $archive_file_name ]; then

  /usr/local/bin/aws s3 cp $archive_file_name s3://$bucket_name/$bucket_path

  if [[ $? -eq 0 ]]; then
        echo "SAS archive file is copied to s3."
  else
        echo "Error in copying the archive file to S3."
  fi
else
  echo 'Error in archiving sas configuration.'
fi
