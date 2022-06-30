#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.planetunix.net/NetBSD/"
dest="/volume1/mirrors/pub/netbsd/iso/"
mkdir -p $dest

RSYNC_LINKS_ARGS="--safe-links --copy-links --hard-links"

rsync \
    -v \
    --archive \
    --update \
    --compress \
    --bwlimit=20000 \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
    --recursive \
    --cvs-exclude \
    --human-readable \
    $RSYNC_LINKS_ARGS \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --exclude="installation" \
    --exclude="src" \
    --exclude="binary" \
    --exclude="/torrent" \
    --exclude="/misc" \
    --include="*/" \
    --include="NetBSD-9.2-amd64.iso" \
    --include="NetBSD-9.2-i386.iso" \
    --include="SHA512" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest

