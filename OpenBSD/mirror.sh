#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.leaseweb.com/openbsd/"
dest="/volume1/mirrors/pub/openbsd/"

rsync \
    -vv \
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
    --exclude="ftplist" \
    --exclude="timestamp" \
    --exclude="Changelogs" \
    --exclude="LibreSSL" \
    --exclude="OpenBGPD" \
    --exclude="OpenIKED" \
    --exclude="OpenNTPD" \
    --exclude="OpenSSH" \
    --exclude="patches" \
    --exclude="rpki-client" \
    --exclude="snapshots" \
    --exclude="songs" \
    --exclude="stable" \
    --exclude="syspatch" \
    --exclude="ANNOUNCEMENT" \
    --exclude="README" \
    --exclude="/SHA256" \
    --exclude="/SHA256.sig" \
    --exclude="openbsd-71-base.pub" \
    --exclude="ports.tar.gz" \
    --exclude="root.mail" \
    --exclude="src.tar.gz" \
    --exclude="sys.tar.gz" \
    --exclude="xenocara.tar.gz" \
    --exclude="packages-stable" \
    --exclude="packages" \
    --exclude="cd*.iso" \
    --include="*/" \
    --include="*.iso" \
    --include="SHA*" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest





