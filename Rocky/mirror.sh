#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dest="/volume1/mirrors/pub/rocky/"
src="rsync://dfw.mirror.rackspace.com/rocky/"
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
    --include="*/" \
    --include="*.iso" \
    --include="CHECKSUM" \
    --include="CHECKSUM.sig" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
