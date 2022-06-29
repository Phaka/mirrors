#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dest="/volume1/mirrors/pub/centos-altarch/"
mkdir -p $dest

src="rsync://mirror.liquidtelecom.com/centos-altarch/"
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
    --exclude="power9" \
    --exclude="aarch64" \
    --exclude="ppc64" \
    --exclude="ppc64le" \
    --exclude="armhfp" \
    --exclude="8*" \
    --include="*/" \
    --include="sha256sum.txt" \
    --include="sha256sum.txt.asc" \
    --exclude="*latest-dvd1.iso" \
    --include="*Everything*.iso" \
    --include="*dvd1.iso" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest

dest="/volume1/mirrors/pub/centos/"
mkdir -p $dest
src="rsync://mirror.liquidtelecom.com/centos/"
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
    --exclude="power9" \
    --exclude="aarch64" \
    --exclude="ppc64" \
    --exclude="ppc64le" \
    --exclude="armhfp" \
    --include="*/" \
    --include="sha256sum.txt" \
    --include="sha256sum.txt.asc" \
    --include="CHECKSUM" \
    --include="CHECKSUM.asc" \
    --exclude="*latest-dvd1.iso" \
    --include="*Everything*.iso" \
    --include="*dvd1.iso" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
