#!/bin/sh
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.leaseweb.com/gentoo/releases/"
dest="/volume1/mirrors/pub/gentoo/releases/"
mkdir -p $dest

rsync \
    --verbose \
    --archive \
    --update \
    --compress \
    --bwlimit=20000 \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
    --safe-links --copy-links --hard-links \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="20220626*" \
    --include="20220627*" \
    --exclude="202206*" \
    --exclude="202205*" \
    --exclude=".timestamp-releases.x" \
    --exclude="README" \
    --exclude="verify-digests.sh" \
    --exclude=".test" \
    --exclude="admincd*" \
    --exclude="livegui*" \
    --exclude="sh" \
    --exclude="sparc" \
    --include="*/" \
    --include="*.iso" \
    --include="*.tar.xz" \
    --include="*.tar.xz" \
    --include="*.CONTENTS.gz" \
    --include="*.DIGESTS" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest


