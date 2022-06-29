#!/bin/sh

src="rsync://mirror.leaseweb.com/archlinux/"
dest="/volume1/mirrors/pub/archlinux/"

rsync \
    -vv \
    --archive \
    --update \
    --compress \
    --bwlimit=20m \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
    --recursive \
    --safe-links \
    --include="*/" \
    --include="*.iso" \
    --include="*.iso.sig" \
    --include="sha256sums.txt" \
    --include="md5sums.txt" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest