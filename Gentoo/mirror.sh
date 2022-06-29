#!/bin/sh

src="rsync://mirror.leaseweb.com/gentoo/releases/"
dest="/volume1/mirrors/pub/gentoo/releases/"
mkdir -p $dest

rsync \
    --verbose \
    --archive \
    --update \
    --compress \
    --hard-links \
    --bwlimit=20m \
    --delete \
    --delete-after \
    --delay-updates \
    --timeout=600 \
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
    --exclude="alpha" \
    --exclude="arm" \
    --exclude="arm64" \
    --exclude="hppa" \
    --exclude="ia64" \
    --exclude="m68k" \
    --exclude="mips" \
    --exclude="ppc" \
    --exclude="riscv" \
    --exclude="s390" \
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


