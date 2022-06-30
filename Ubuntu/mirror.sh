#!/bin/sh
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.leaseweb.com/ubuntu-releases/"
dest="/volume1/mirrors/pub/ubuntu-releases/"

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
    --safe-links \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="SHA*" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest 