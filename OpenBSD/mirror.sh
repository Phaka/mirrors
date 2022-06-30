#!/bin/bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.leaseweb.com/openbsd/"
dest="/volume1/mirrors/pub/openbsd/"

rsync \
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
