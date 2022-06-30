#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "--- "
echo "--- CentOS Alt"
echo "--- "

dest="/volume1/mirrors/pub/centos-altarch/"
src="rsync://mirror.liquidtelecom.com/centos-altarch/"
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
    --exclude="*-Minimal-*" \
    --exclude="*-NetInstall-*" \
    --exclude="boot.iso" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="sha256sum.txt" \
    --include="sha256sum.txt.asc" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest

echo "--- "
echo "--- CentOS"
echo "--- "

dest="/volume1/mirrors/pub/centos/"
src="rsync://mirror.liquidtelecom.com/centos/"
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
    --exclude="*-Minimal-*" \
    --exclude="*-NetInstall-*" \
    --exclude="boot.iso" \
    --exclude="*boot.iso" \
    --exclude="BaseOS/" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="*/" \
    --include="sha256sum.txt" \
    --include="sha256sum.txt.asc" \
    --include="CHECKSUM" \
    --include="CHECKSUM.asc" \
    --include="*.iso" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
