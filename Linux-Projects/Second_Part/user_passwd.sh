#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
if test ${UID} != 0
then
	echo "Please run the script with sudo"
	exit 1
fi

# Get the username (login).
login=$1

# Get the real name (contents for the description field).
fullname=$2
# Get the password.
read -sp "Enter the password: " pswd

# Create the account.

useradd -c ${fullname} ${login}

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if test $? = 0
then
	echo "SUCCEEDED"
else
	echo "Something went wrong. Exiting..."
	exit 2
fi
# Set the password.
passwd ${login}
# Check to see if the passwd command succeeded.

# Force password change on first login.

# Display the username, password, and the host where the user was created.

