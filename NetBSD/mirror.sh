#!/bin/bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.planetunix.net/NetBSD/"
dest="/volume1/mirrors/pub/netbsd/"
mkdir -p $dest
rsync \
    --verbose \
    --human-readable \
    --archive \
    --update \
    --compress \
    --bwlimit=20000 \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
    --no-motd \
    --safe-links --copy-links --hard-links \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --exclude="installation" \
    --exclude="src" \
    --exclude="binary" \
    --exclude="/torrent" \
    --exclude="/misc" \
    --include="*/" \
    --include="*-amd64.iso" \
    --include="*-i386.iso" \
    --include="SHA512" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest

