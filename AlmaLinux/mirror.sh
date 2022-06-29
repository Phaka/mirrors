#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://rsync.repo.almalinux.org/almalinux/"
dest="/volume1/mirrors/pub/almalinux/"
mkdir -p $dest

rsync \
    --verbose \
    --archive \
    --update \
    --compress \
    --bwlimit=20m \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
    --cvs-exclude \
    --recursive \
    --prune-empty-dirs \
    --exclude-from="$SCRIPT_DIR/exclude.txt" \
    --include-from="$SCRIPT_DIR/include.txt" \
    $src \
    $dest 
