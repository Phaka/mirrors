#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dest="/volume1/mirrors/pub/freebsd/releases/"
mkdir -p $dest

src="rsync://mirror.liquidtelecom.com/freebsd/releases/"
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
    --safe-links --copy-links --hard-links \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --exclude="README.TXT" \
    --exclude="TIMESTAMP" \
    --exclude="CI-IMAGES" \
    --exclude="/ISO-IMAGES" \
    --exclude="VM-IMAGES" \
    --exclude="*-bootonly.iso" \
    --exclude="*-disc1.iso" \
    --include="*.iso" \
    --include="CHECKSUM*" \
    --include="SHA*" \
    --include="*/" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest

dest="/volume1/mirrors/pub/freebsd/FreeBSD-Archive/old-releases/"
mkdir -p $dest
src="rsync://ftp-archive.freebsd.org/FreeBSD-Archive/old-releases/"
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
    --safe-links --copy-links --hard-links \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
    --exclude="*BETA*" \
    --exclude="1.*" \
    --exclude="2.*" \
    --exclude="3.*" \
    --exclude="4.*" \
    --exclude="5.*" \
    --exclude="6.*" \
    --exclude="7.*" \
    --exclude="8.*" \
    --exclude="9.*" \
    --exclude="FreeBSD-1.*" \
    --exclude="FreeBSD-2.*" \
    --exclude="FreeBSD-3.*" \
    --exclude="FreeBSD-4.*" \
    --exclude="FreeBSD-5.*" \
    --exclude="FreeBSD-6.*" \
    --exclude="FreeBSD-7.*" \
    --exclude="FreeBSD-8.*" \
    --exclude="FreeBSD-9.*" \
    --exclude="10.0-RELEASE" \
    --exclude="10.1-RELEASE" \
    --exclude="10.2-RELEASE" \
    --exclude="10.3-RELEASE" \
    --exclude="11.0-RELEASE" \
    --exclude="11.1-RELEASE" \
    --exclude="12.0-RELEASE" \
    --exclude="12.1-RELEASE" \
    --exclude="12.2-RELEASE" \
    --exclude="13.0-RELEASE" \
    --exclude="README.TXT" \
    --exclude="TIMESTAMP" \
    --exclude="CI-IMAGES" \
    --exclude="/ISO-IMAGES" \
    --exclude="VM-IMAGES" \
    --exclude="*-bootonly.iso" \
    --exclude="*-disc1.iso" \
    --include="*.iso" \
    --include="CHECKSUM*" \
    --include="SHA*" \
    --include="*/" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \

