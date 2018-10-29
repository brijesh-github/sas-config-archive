#!/bin/bash

archive_file_name="/tmp/sas-config-$(date +'%m%d%Y').tar.gz"
bucket_path="$(date +'%Y')/$(date +'%B')/"

tar -zcvf $archive_file_name /etc/puppetlabs/code/environments/production/modules/role  > /dev/null 2>&1

if [ -f $archive_file_name ]; then
  aws s3 cp $archive_file_name s3://bucket-name/$bucket_path 
  
  if [[ $? -eq 0 ]]; then
	echo "SAS archive file is copied to s3."
  else 
  	echo "Error in copying the archive file to S3."
  fi
else
  echo 'Error in archiving sas configuration.'
fi

