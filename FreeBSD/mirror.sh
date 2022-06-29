#!/bin/sh

#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dest="/volume1/mirrors/pub/freebsd/releases/"
mkdir -p $dest

src="rsync://mirror.liquidtelecom.com/freebsd/releases/"
rsync \
    -vv \
    --archive \
    --update \
    --compress \
    --bwlimit=20m \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
    --recursive \
    --safe-links \
    --exclude="README.TXT" \
    --exclude="TIMESTAMP" \
    --exclude="CI-IMAGES" \
    --exclude="/ISO-IMAGES" \
    --exclude="VM-IMAGES" \
    --exclude="arm" \
    --exclude="arm64" \
    --exclude="powerpc" \
    --exclude="riscv" \
    --exclude="sparc64" \
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


