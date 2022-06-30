#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dest="/volume1/mirrors/pub/debian/cdimage/archive/"
mkdir -p $dest
src="rsync://cdimage.debian.org/cdimage/archive/"
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
    --no-motd \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --exclude="*-live" \
    --exclude="HEADER.html" \
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
    --exclude="bullseye*" \
    --exclude="buster*" \
    --exclude="latest*" \
    --exclude="older*" \
    --exclude="project" \
    --exclude="stretch*" \
    --exclude="source" \
    --exclude="multi-arch" \
    --exclude="source" \
    --exclude="trace" \
    --exclude="bt-*" \
    --include="iso-dvd" \
    --exclude="iso-*" \
    --exclude="jigdo-*" \
    --exclude="list-*" \
    --exclude="log" \
    --include="*.iso" \
    --include="SHA256SUMS" \
    --include="SHA256SUMS.sign" \
    --include="SHA512SUMS" \
    --include="SHA512SUMS.sign" \
    --include="*/" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest


dest="/volume1/mirrors/pub/debian/cdimage/release/"
mkdir -p $dest
src="rsync://cdimage.debian.org/cdimage/release/"
rsync \
    --dry-run \
    --verbose \
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
    --exclude="*-live" \
    --exclude="HEADER.html" \
    --exclude="current*" \
    --exclude="project" \
    --exclude="source" \
    --exclude="arm64" \
    --exclude="armel" \
    --exclude="armhf" \
    --exclude="mips" \
    --exclude="mips64el" \
    --exclude="mipsel" \
    --exclude="multi-arch" \
    --exclude="powerpc" \
    --exclude="ppc64el" \
    --exclude="s390x" \
    --exclude="source" \
    --exclude="trace" \
    --exclude="bt-*" \
    --include="iso-dvd" \
    --exclude="iso-*" \
    --exclude="jigdo-*" \
    --exclude="list-*" \
    --exclude="log" \
    --include="*.iso" \
    --include="SHA*" \
    --include="*/" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
