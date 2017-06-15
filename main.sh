#!/bin/sh

# Figure out what OS we're on and execute the appropriate script.

BASE=$(dirname "$0")

if command -v useradd >/dev/null 2>&1; then
    . $BASE/has_useradd.sh
elif command -v adduser > /dev/null 2>&1; then
    . $BASE/has_adduser.sh
else
    echo "Couldn't find either adduser or useradd. Failing."
    exit 1
fi
