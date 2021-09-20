#!/bin/bash

exitcode='0';

localdir=$(pwd);
cd "$localdir";

GitHubDirSource(){
	echo "Project source: https://github.com/silvajhb/architecture-files-cli";
}

print_usage(){
	echo '';
	GitHubDirSource;
	echo '';
	echo 'Usage: mkarchdir.sh1 [ -hw ] [ -sw ] [ -docs ] [ -readme ]';
	echo 'Option: (optional)';
	echo '	-hw	Add Hardware Directories';
	echo '	-sw	Add Software Directories';
	echo '	-docs	Add Docments Directories';
	echo '	-readme	Add README.md Files in all Directories(All README.md files recept respective title)';
	echo '';
}

CreateHWDir(){
	if [ -d "$localdir/HARDWARE" ]; then
		echo 'HARDWARE Directory is already exist!';			
		exitcode='1';
		exit $exitcode;
	else
		echo 'HARDWARE Directory not exist!';
		echo 'Start create HARDWARE directory!';
		mkdir -v "$localdir"/HARDWARE;
		exitcode='0';
		exit $exitcode;
	fi
}

CreateSWDir(){
	if [ -d "$localdir/SOFTWARE" ]; then
		echo 'SOFTWARE Directory is already exist!';			
		exitcode='1';
		exit $exitcode;
	else
		echo 'SOFTWARE Directory not exist!';
		echo 'Start create SOFTWARE directory!';
		mkdir -v "$localdir"/SOFTWARE;
		exitcode='0';
		exit $exitcode;
	fi

}

while [ -n "$1" ]; do
	if [ "$1" = "-hw" ]; then
		shift
		CreateHWDir;
	elif [ "$1" = "-sw" ]; then
		shift
		createSWDir;
	elif [ "$1" = "-docs" ]; then
		shift
	elif [ "$1" = "-readme" ]; then
		shift
	elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
		print_usage;
		exitcode='0';
		exit $exitcode;
	else
		print_usage;
		exitcode='1';
		exit $exitcode;
	fi
	shift
done

