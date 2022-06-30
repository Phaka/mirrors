#!/bin/sh
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://rsync.alpinelinux.org/alpine/"
dest="/volume1/mirrors/pub/alpine/"
mkdir -p $dest
rsync \
    --dry-run \
    --verbose \
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
    --exclude="community" \
    --exclude="main" \
    --exclude="*_rc*" \
    --exclude="*-xen-*" \
    --exclude="*netboot*" \
    --exclude="*minirootfs*" \
    --exclude="*vanilla*" \
    --exclude="*-standard-*" \
    --exclude="MIRRORS.txt" \
    --exclude="last-updated" \
    --exclude="latest-stable" \
    --exclude="edge" \
    --exclude="v3.0" \
    --exclude="v3.1" \
    --exclude="v3.10" \
    --exclude="v3.11" \
    --exclude="v3.2" \
    --exclude="v3.3" \
    --exclude="v3.4" \
    --exclude="v3.5" \
    --exclude="v3.6" \
    --exclude="v3.7" \
    --exclude="v3.8" \
    --exclude="v3.9" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="*.iso.sha256" \
    --include="*.iso.asc" \
    --include="*.iso.sha512" \
    --exclude="*" \
    --cvs-exclude \
    $src \
    $dest
    
