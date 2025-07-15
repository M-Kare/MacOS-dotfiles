#!/bin/bash

RUNNING=$(ps -ef | grep pdfRenamer.py | grep -v grep)

if [ -z "$RUNNING" ];then
	sketchybar --set pdfRenamer label=" "
else
	sketchybar --set pdfRenamer label=" "
fi
