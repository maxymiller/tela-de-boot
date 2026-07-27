#!/bin/bash

case "$1" in
	1) echo "$2" | cat -n | sed -n "$3";;
	2) echo "$2" | cat | sed -n "$3";;
esac
