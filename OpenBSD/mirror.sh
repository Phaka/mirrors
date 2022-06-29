#!/bin/bash

src="rsync://mirror.leaseweb.com/openbsd/"
dest="/volume1/mirrors/pub/openbsd/"

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
    --cvs-exclude \
    --safe-links \
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
    --exclude="alpha" \
    --exclude="arm64" \
    --exclude="armv7" \
    --exclude="hppa" \
    --exclude="landisk" \
    --exclude="luna88k" \
    --exclude="loongson" \
    --exclude="macppc" \
    --exclude="octeon" \
    --exclude="packages-stable" \
    --exclude="packages" \
    --exclude="powerpc64" \
    --exclude="riscv64" \
    --exclude="sparc64" \
    --exclude="cd*.iso" \
    --include="*/" \
    --include="*.iso" \
    --include="SHA*" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest





