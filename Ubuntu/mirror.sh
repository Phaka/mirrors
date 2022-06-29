#!/bin/sh

src="rsync://mirror.leaseweb.com/ubuntu-releases/"
dest="/volume1/mirrors/pub/ubuntu-releases/"

rsync \
    --verbose \
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
    --cvs-exclude \
    --exclude=".pool" \
    --include="*/" \
    --include="*.iso" \
    --include="SHA*" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest 