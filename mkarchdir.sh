#!/bin/bash

localdir=$(pwd);

cd "$localdir";

print_usage(){
	echo '';
	echo 'Usage: mkarchdir.sh1 [ -h ] [ -s ] [ -d ] [ -R ]';
	echo 'Option: (optional)';
	echo '	-h	Add Hardware Directories';
	echo '	-s	Add Software Directories';
	echo '	-d	Add Docments Directories';
	echo '	-R	Add README.md Files in all Directories(All README.md files recept respective title)';
	echo '';
}
