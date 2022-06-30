#!/bin/sh
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://rsync.alpinelinux.org/alpine/"
dest="/volume1/mirrors/pub/alpine/"
#mkdir -p $dest
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
    --exclude="/v3.0" \
    --exclude="/v3.1" \
    --exclude="/v3.10" \
    --exclude="/v3.11" \
    --exclude="/v3.2" \
    --exclude="/v3.3" \
    --exclude="/v3.4" \
    --exclude="/v3.5" \
    --exclude="/v3.6" \
    --exclude="/v3.7" \
    --exclude="/v3.8" \
    --exclude="/v3.9" \
    --exclude="*-xen-*" \
    --exclude="*-standard-*" \
    --exclude="*_rc*" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="*.iso.sha256" \
    --include="*.iso.asc" \
    --include="*.iso.sha512" \
    --exclude="*" \
    --cvs-exclude \
    --prune-empty-dirs \
    $src \
    $dest
