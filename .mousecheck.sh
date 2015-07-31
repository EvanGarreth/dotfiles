#!/bin/bash
list=`xinput --list | grep -i 'mouse'`

if [ ${#list} -eq 0 ]; then
	exec  `synclient touchpadoff=0`
else
	exec `synclient touchpadoff=1`
fi
