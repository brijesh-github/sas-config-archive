# sas-config-archive


1. Create the S3 Write Access Policy

2. Create a Role with the policy created in the above step.

3. Assign the role to the SAS EC2 instance as instance profile. 

4. Check and install AWS CLI on the EC2 instance.

5. Copy archive.sh to the server in the following location, /opt/sas-config-scheduler and make it exectuable. 

6. Test the script by running manually.

7. Update the crontab, and add the archive script to execute everday at 1 AM.

  0 1 * * * /home/centos/archive-tool/archive.sh >> /var/log/sas-config-archive.log


