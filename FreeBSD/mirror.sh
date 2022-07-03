#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dest="/volume1/mirrors/pub/freebsd/releases/"
mkdir -p $dest
src="rsync://ftp-archive.freebsd.org/FreeBSD/releases/"
rsync \
    --dry-run \
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
    --exclude="*-RC*" \
    --exclude="*-bootonly.iso" \
    --exclude="*-disc1.iso" \
    --exclude="VM-IMAGES/" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch2.txt" \
    --include="*.iso" \
    --include="CHECKSUM*" \
    --include="SHA*" \
    --include="*/" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest

dest="/volume1/mirrors/pub/freebsd/old-releases/ISO-IMAGES/"
mkdir -p $dest
src="rsync://ftp-archive.freebsd.org/FreeBSD-Archive/old-releases/ISO-IMAGES/"
rsync \
    --dry-run \
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
    --exclude="*-RC*" \
    --exclude="*-bootonly.iso" \
    --exclude="*-disc1.iso" \
    --exclude="*-bootonly.iso" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch2.txt" \
    --include="*.iso" \
    --include="CHECKSUM*" \
    --include="SHA*" \
    --include="*/" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
