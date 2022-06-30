#!/bin/sh
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.leaseweb.com/archlinux/"
dest="/volume1/mirrors/pub/archlinux/"

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
    --cvs-exclude \
    --no-motd \
    --safe-links --copy-links --hard-links \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="*.iso.sig" \
    --include="sha256sums.txt" \
    --include="md5sums.txt" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest