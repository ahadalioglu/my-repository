#!/bin/bash

# Check if we are root privilage or not
if test ${UID} != 0
then
	echo "Please run the script with sudo"
	exit 1
fi
# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
bk_files='/home/ec2-user/data'

# Where do we backup to. Please create this file before execute this script
dest='/mnt/backup'
mkdir ${dest} 2> /dev/null
host=`hostname -s`
# Create archive filename based on time
tarname="`TZ=EST date +'%Y%m%d_%I%M_%p'`.tgz"

# Print start status message.
echo "Backup process started..."

# Backup the files using tar.
tar -czf ${dest}/${host}_${tarname} ${bk_files} 2> /dev/null

# Print end status message.
echo "Backup process is DONE."

# Long listing of files in $dest to check file sizes.
ls -lh ${dest}
