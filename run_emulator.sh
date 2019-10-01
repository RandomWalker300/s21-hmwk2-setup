#!/bin/bash

EMULATOR_NAME="w4118_emu"
NO_SNAP="-no-snapshot"
SHOW_KERNEL=""
KERNEL=""
EMULATOR_PATH="$HOME/Android/Sdk/tools/emulator"
NO_WINDOW=""
RAM=""
DEBUG=""

usage()
{
	echo "usage:	run_emulator [-p emulator_path][-n emulator_name] [-m RAM_SIZE][-k kernel_path] [-s] [-c]"
	echo "	emulator_path default to $EMULATOR_PATH."
	echo "	emulator_name default to $EMULATOR_NAME."
	echo "	-m: set the RAM size in MB from 128-4096, defualt to 2048,"
	echo "	    reduece this if your emulator is too slow."
	echo "	-k: specify a kernel image."
	echo "	    When you specify a kernel image, the -s option will be enabled"
	echo "	-s: show kernel log infomation."
	echo "	-c: command line only, use this if your emulator is too slow"
}

while [ "$1" != "" ]; do
	case $1 in
		-k | --kernel )	shift
				KERNEL="-kernel $1"
				SHOW_KERNEL="-show-kernel"
				;;
		-e | --emulator ) shift
				EMULATOR_PATH=$1
				;;
		-n | --name ) 	shift
				EMULATOR_NAME=$1
				;;
		-s | --show-kernel )
				SHOW_KERNEL="-show-kernel"
				;;
		-c | --no-window )
				NO_WINDOW="-no-window"
				;;
		-m | --memory ) shift
				RAM="-memory $1"
				;;
		-d | --debug ) shift
				DEBUG="-qemu -s -S"
				;;
		-h | --help | * )	usage
					exit
					;;
	esac
	shift
done

$EMULATOR_PATH @$EMULATOR_NAME $NO_SNAP $SHOW_KERNEL $KERNEL $NO_WINDOW $DEBUG
