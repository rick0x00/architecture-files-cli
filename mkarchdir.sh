#!/bin/bash

localdir=$(pwd);
cd "$localdir";

GITHUBDIR(){
	echo "Project source: https://github.com/silvajhb/architecture-files-cli";
}

print_usage(){
	echo '';
	GITHUBDIR;
	echo 'Usage: mkarchdir.sh1 [ -h ] [ -s ] [ -d ] [ -R ]';
	echo 'Option: (optional)';
	echo '	-h	Add Hardware Directories';
	echo '	-s	Add Software Directories';
	echo '	-d	Add Docments Directories';
	echo '	-R	Add README.md Files in all Directories(All README.md files recept respective title)';
	echo '';
}

while [ -n "$1" ]; do
	if [ "$1" = "-h" ];then
		shift
	elif [ "$1" = "-s" ]; then
		shift
	elif [ "$1" = "-d" ]; then
		shift
	elif [ "$1" = "-R" ]; then
		shift
	elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
		print_usage;
		exit 0;
	else
		print_usage;
		exit 1;
	fi
	shift
done

