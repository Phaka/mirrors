#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dest="/volume1/mirrors/pub/oracle/"
src="rsync://mirrors.kernel.org/mirrors/oracle-linux-isos/"
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
    --exclude="source/" \
    --exclude="*boot*" \
    --exclude="*disc*" \
    --exclude="EL4/" \
    --exclude="EL5/" \
    --exclude="/OL6/GA/" \
    --exclude="/OL6/U1/" \
    --exclude="/OL6/U2/" \
    --exclude="/OL6/U3/" \
    --exclude="/OL6/U4/" \
    --exclude="/OL6/U5/" \
    --exclude="/OL6/U6/" \
    --exclude="/OL6/U7/" \
    --exclude="/OL6/U8/" \
    --exclude="/OL7/u0/" \
    --exclude="/OL7/u1/" \
    --exclude="/OL7/u2/" \
    --exclude="/OL7/u3/" \
    --exclude="/OL7/u4/" \
    --exclude="/OL7/u5/" \
    --exclude="/OL7/u6/" \
    --exclude="/OL7/u7/" \
    --exclude="/OL7/u8/" \
    --exclude="/OL8/u0/" \
    --exclude="/OL8/u1/" \
    --exclude="/OL8/u2/" \
    --exclude="/OL8/u3/" \
    --exclude="/OL8/u4/" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch2.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="*.sha1sum" \
    --include="*.sha256sum" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest


