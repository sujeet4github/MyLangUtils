#!/usr/bin/bash
###
# check env variables, make sure that tools can be run
#
if [ "$COMPUTERNAME" = "SEDTS-L1LF-13HN" ];
then
	echo "Use Dos Window: run script \s\doc\scripts\envSetRuby.bat"
	export RUBY_HOME=/c/S/opt/DevEnv/Ruby23-x64
	export PATH=$PATH:$RUBY_HOME/bin
	ruby -v

else
	echo "Don't know how to work on this machine"
fi
