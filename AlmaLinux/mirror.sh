#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://rsync.repo.almalinux.org/almalinux/"
dest="/volume1/mirrors/pub/almalinux/"
mkdir -p $dest

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
    --cvs-exclude \
    --recursive \
    --safe-links \
    --prune-empty-dirs \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --exclude-from="$SCRIPT_DIR/exclude.txt" \
    --include-from="$SCRIPT_DIR/include.txt" \
    $src \
    $dest 
