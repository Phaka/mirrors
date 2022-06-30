#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dest="/volume1/mirrors/pub/debian/cdimage/"
mkdir -p $dest
src="rsync://cdimage.debian.org/cdimage/"
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
    --exclude="/HEADER.html" \
    --exclude="/openstack" \
    --exclude="/.bullseye_release" \
    --exclude="/.buster_release" \
    --exclude="/.debian-mirror" \
    --exclude="/.git" \
    --exclude="/.incoming" \
    --exclude="/.search-db" \
    --exclude="/.stretch_release" \
    --exclude="/.work" \
    --exclude="/blends-live" \
    --exclude="/cd-sources" \
    --exclude="/cloud" \
    --exclude="/daily-builds" \
    --exclude="/ports" \
    --exclude="/snapshot-alternate" \
    --exclude="/snapshot-amd64" \
    --exclude="/snapshot" \
    --exclude="/unofficial" \
    --exclude="/weekly-builds" \
    --exclude="older-contrib/" \
    --exclude="*-live/" \
    --exclude="*BROKEN_DO_NOT_USE/" \
    --include="iso-dvd/" \
    --exclude="bt-*" \
    --exclude="iso-*" \
    --exclude="jigdo-*" \
    --exclude="list-*" \
    --exclude="log" \
    --exclude="*_rc*" \
    --exclude="*_alpha*" \
    --exclude="3.*" \
    --exclude="4.*" \
    --exclude="5.*" \
    --exclude="6.*" \
    --exclude="7.*" \
    --exclude="8.0.*" \
    --exclude="8.1.*" \
    --exclude="8.2.*" \
    --exclude="8.3.*" \
    --exclude="8.4.*" \
    --exclude="8.5.*" \
    --exclude="8.6.*" \
    --exclude="8.7.*" \
    --exclude="8.8.*" \
    --exclude="8.9.*" \
    --exclude="8.10.*" \
    --exclude="9.0.*" \
    --exclude="9.1.*" \
    --exclude="9.2.*" \
    --exclude="9.3.*" \
    --exclude="9.4.*" \
    --exclude="9.5.*" \
    --exclude="9.6.*" \
    --exclude="9.7.*" \
    --exclude="9.8.*" \
    --exclude="9.9.*" \
    --exclude="9.10.*" \
    --exclude="9.11.*" \
    --exclude="9.12.*" \
    --exclude="10.0.*" \
    --exclude="10.1.*" \
    --exclude="10.2.*" \
    --exclude="10.3.*" \
    --exclude="10.4.*" \
    --exclude="10.5.*" \
    --exclude="10.6.*" \
    --exclude="10.7.*" \
    --exclude="10.8.*" \
    --exclude="10.9.*" \
    --exclude="10.10.*" \
    --exclude="10.11.*" \
    --exclude="11.0.*" \
    --exclude="11.1.*" \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --include="*/" \
    --include="*.iso" \
    --include="SHA256SUMS" \
    --include="SHA256SUMS.sign" \
    --include="SHA512SUMS" \
    --include="SHA512SUMS.sign" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
