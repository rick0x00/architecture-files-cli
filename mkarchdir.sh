#!/bin/bash

exitcode='0';
s='0';
localdir=$(pwd);
cd "$localdir";

GitHubDirSource(){
	echo "Project source: https://github.com/silvajhb/architecture-files-cli";
}

ExitFunction(){
	exit $exitcode;
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
	else
		echo 'HARDWARE Directory not exist!';
		echo 'Start create HARDWARE directory!';
		mkdir -v "$localdir"/HARDWARE;
		exitcode='0';
	fi
}

CreateSWDir(){
	if [ -d "$localdir/SOFTWARE" ]; then
		echo 'SOFTWARE Directory is already exist!';			
		exitcode='1';
	else
		echo 'SOFTWARE Directory not exist!';
		echo 'Start create SOFTWARE directory!';
		mkdir -v "$localdir"/SOFTWARE;
		exitcode='0';
	fi

}

while [ -n "$1" ]; do
	if [ "$1" = "-hw" ]; then
		CreateHWDir;
		shift;
		s='0';
	fi
	if [ "$1" = "-sw" ]; then
		CreateSWDir;
		shift;
		s='0';
	fi
	if [ "$1" = "-docs" ]; then
		shift
		s='0';
	fi
	if [ "$1" = "-readme" ]; then
		shift
		s='0';	
	fi
	if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
		print_usage;
		exitcode='0';
		s='0';
		ExitFunction;
	else
		s="$s"+1;
		if [ "$s" = "2" ]; then
			s='0';
			ExitFunction;
		fi
	fi
done

