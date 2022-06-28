#!/bin/sh
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://rsync.alpinelinux.org/alpine/"
dest="/volume1/mirrors/pub/alpine/"
mkdir -p $dest
rsync \
    --archive \
    --update \
    --compress \
    --hard-links \
    --bwlimit=20m \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
    --recursive \
    --exclude-from="$SCRIPT_DIR/exclude.txt" \
    --include-from="$SCRIPT_DIR/include.txt" \
    --cvs-exclude \
    $src \
    $dest
    