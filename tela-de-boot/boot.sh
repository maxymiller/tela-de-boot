#!/bin/bash
echo "$PWD>: \"$0\""
echo

cmdline0="/root/tela-de-boot"
cmdline1="./start.sh"
cmdline2="./linux.sh"

echo "$PWD>: cd \"$cmdline0\""
echo

cd "$cmdline0"

echo "$PWD>: \"$cmdline1\""
echo

"$cmdline1"

echo "$PWD>: \"$cmdline2\""
echo

"$cmdline2"
