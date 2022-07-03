#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.leaseweb.com/opensuse/"
dest="/volume1/mirrors/pub/opensuse/"
rsync \
    --dry-run \
    --verbose \
    --human-readable \
    --archive \
    --update \
    --compress \
    --bwlimit=20000 \
    --delay-updates \
    --timeout=600 \
    --no-motd \
    --safe-links --copy-links --hard-links \
    --fuzzy \
    --exclude="iso-devel/"  \
    --exclude="Changes/" \
    --exclude="appliances/" \
    --exclude="*-Rescue-*" \
    --exclude="*-NET-*" \
    --exclude="*-MicroOS-*" \
    --exclude="*-Kubic-*" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch2.txt" \
    --exclude-from="$SCRIPT_DIR/../exclude-desktops.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="*.iso.sha256" \
    --include="*.iso.sha256.asc" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
