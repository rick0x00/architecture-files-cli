#!/bin/bash

exitcode='0';
s='0';
localdir=$(pwd);
cd "$localdir";

function GitHubDirSource(){
	echo "Project source: https://github.com/silvajhb/architecture-files-cli";
}

function ExitFunction(){
	exit $exitcode;
}

function print_usage(){
	echo '';
	GitHubDirSource;
	echo '';
	echo 'Usage: mkarchdir.sh1 [ -hw ] [ -eda ] [ -cad ] [ -sw ] [ -docs ] [ -readme ]';
	echo 'Option: (optional)';
	echo '	-hw	Add Hardware Directory';
	echo '	-eda	Add EDA Directory';
	echo '	-cad	Add CAD Directory';
	echo '	-sw	Add Software Directory';
	echo '	-docs	Add Docments Directories';
	echo '	-readme	Add README.md Files in all Directories(All README.md files recept respective title)';
	echo '';
}

function CreateEDADir(){
	if [ -d "$localdir/HARDWARE" ]; then
		if [ -d "$localdir/HARDWARE/EDA" ]; then
			echo 'EDA Directory is already exist!';	
		else
			echo 'HARDWARE Directory exist!';			
			echo 'Start create "Electronic Design Automation"(EDA) directory!';
			mkdir -v "$localdir"/HARDWARE/EDA;
			exitcode='0';
		fi
	else
		echo 'HARDWARE Directory not exist!';
		echo 'Create EDA Directory failed!';
		exitcode='1';
	fi
}

function CreateCADDir(){
	if [ -d "$localdir/HARDWARE" ]; then
		if [ -d "$localdir/HARDWARE/CAD" ]; then
			echo 'CAD Directory is already exist!';	
		else
			echo 'HARDWARE Directory exist!';			
			echo 'Start create "Computer-Aided Design"(CAD) directory!';
			mkdir -v "$localdir"/HARDWARE/CAD;
			exitcode='0';
		fi
	else
		echo 'HARDWARE Directory not exist!';
		echo 'Create EDA Directory failed!';
		exitcode='1';
	fi
}

function CreateHWDir(){
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

function CreateSWDir(){
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

function CreateDocsDir(){
	if [ -d "$localdir/DOCUMENTS" ]; then
		echo 'DOCUMENTS Directory is already exist!';			
		exitcode='1';
	else
		echo 'DOCUMENTS Directory not exist!';
		echo 'Start create DOCUMENTS directory!';
		mkdir -v "$localdir"/DOCUMENTS;
		exitcode='0';
	fi
	if [ -d "$localdir/HARDWARE" ]; then
		if [ -d "$localdir/HARDWARE/DOCUMENTS" ]; then
			echo 'HARDWARE DOCUMENTS Directory is already exist!';			
			exitcode='1';
		else
			echo 'HARDWARE DOCUMENTS Directory not exist!';
			echo 'Start create HARDWARE DOCUMENTS directory!';
			mkdir -v "$localdir"/HARDWARE/DOCUMENTS;
			exitcode='0';
		fi 
	fi
	if [ -d "$localdir/SOFTWARE" ]; then
		if [ -d "$localdir/SOFTWARE/DOCUMENTS" ]; then
			echo 'SOFTWARE DOCUMENTS Directory is already exist!';			
			exitcode='1';
		else
			echo 'SOFTWARE DOCUMENTS Directory not exist!';
			echo 'Start create SOFTWARE DOCUMENTS directory!';
			mkdir -v "$localdir"/SOFTWARE/DOCUMENTS;
			exitcode='0';
		fi 
	fi
}

function CreateReadmeDir(){
	if [ -f "$localdir/README.md" ]; then
		echo "$localdir/README.md already exists!";
	else
		echo "$localdir/README.md no exists!";
		echo 'Start create README.md file!';
		touch "$localdir/README.md";
		var=$(basename $(pwd));
		var="#"$var;
		echo $var > "$localdir"/README.md;
	fi
	if [ -d "$localdir/HARDWARE" ]; then
		if [ -f "$localdir/HARDWARE/README.md" ]; then
			echo "$localdir/HARDWARE/README.md already exists!";
		else
			echo "$localdir/HARDWARE/README.md no exists!";
			echo 'Start create HARDWARE/README.md file!';
			touch "$localdir/HARDWARE/README.md";
			var=$(basename $(pwd));
			var="#"$var;
			echo $var > "$localdir"/HARDWARE/README.md;
		fi
	fi
	if [ -d "$localdir/SOFTWARE" ]; then
		if [ -f "$localdir/SOFTWARE/README.md" ]; then
			echo "$localdir/SOFTWARE/README.md already exists!";
		else
			echo "$localdir/SOFTWARE/README.md no exists!";
			echo 'Start create SOFTWARE/README.md file!';
			touch "$localdir/SOFTWARE/README.md";
			var=$(basename $(pwd));
			var="#"$var;
			echo $var > "$localdir"/SOFTWARE/README.md;
		fi
	fi
}

while [ -n "$1" ]; do
	if [ "$1" = "-hw" ]; then
		CreateHWDir;
		shift;
		s='0';
	fi
	if [ "$1" = "-eda" ]; then
		CreateEDADir;
		shift;
		s='0';
	fi
	if [ "$1" = "-cad" ]; then
		CreateCADDir;
		shift;
		s='0';
	fi
	if [ "$1" = "-sw" ]; then
		CreateSWDir;
		shift;
		s='0';
	fi
	if [ "$1" = "-docs" ]; then
		CreateDocsDir;
		shift
		s='0';
	fi
	if [ "$1" = "-readme" ]; then
		CreateReadmeDir;
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
