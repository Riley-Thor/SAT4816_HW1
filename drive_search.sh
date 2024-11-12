#!/bin/bash

usage() {
	echo "Usage: $0 <operation_type> <keyword>"
	echo "operation_type: 0 for search, 1 for extraction"
	echo "keyword: Specify the type of data (e.g., phone, url, email, ip, username)"
	exit 1
}

if [ "$#" -ne 2 ]; then
	echo "Error: Incorrect number of arguments."
	usage
fi

operation_type=$1
keyword=$2

regex_phone='(\()?\b[0-9]{3}(?(1)\)[. -]?|[. -]?)[0-9]{3}[. -]?[0-9]{4}\b' 
regex_url='http://www\..+\.[a-z]{3,4}'
regex_email='[a-zA-Z0-9.-]{2,15}@[a-zA-Z0-9]{1,15}\.[a-zA-Z0-9]{3,4}'
regex_ip='([0-9]{1,3}\.){3}[0-9]{1,3}'
regex_username='^[A-Z][^,]*, [^,]*'

case "$keyword" in
	phone)
		regex=$regex_phone
		;;
	url)
		regex=$regex_url
		;;
	email)
		regex=$regex_email
		;;
	ip)
		regex=$regex_ip
		;;
	username)
		regex=$regex_username
		;;
	*)
		echo "Invalid keyword. Choose from phone, url, email, ip, username."
		usage
		;;
esac


if [ "$operation_type" -eq 0 ]; then
	if [ "$keyword" = "phone"  ]; then
		echo "Searching for $keyword in files..."
		grep -P "$regex" ./*
	else
		echo "Searching for $keyword in files..."
		grep -E "$regex" ./*
	fi
elif [ "$operation_type" -eq 1 ]; then
	if [ "$keyword" = "phone" ]; then
		echo "Extracting $keyword from files..."
		cat ./* | strings | grep -P "$regex"
	else
		echo "Extracting $keyword from files..."
		cat ./* | strings | grep -E "$regex"
	fi
else
	echo "Invalid operation type. Use 0 for search, 1 for extraction."
	usage
fi

