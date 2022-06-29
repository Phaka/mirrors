#!/bin/bash

src="rsync://mirror.leaseweb.com/opensuse/tumbleweed/"
dest="/volume1/mirrors/pub/opensuse/tumbleweed/"
mkdir -p $dest
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
    --exclude="repo" \
    --exclude="appliances" \
    --exclude="iso-devel" \
    --exclude="jeos" \
    --exclude="live" \
    --exclude="microos" \
    --exclude="leap-micro" \
    --exclude="*NET*" \
    --exclude="*aarch64*" \
    --exclude="*ppc64le*" \
    --exclude="*s390x*" \
    --exclude="*Snapshot*" \
    --exclude="*GNOME*" \
    --exclude="*KDE*" \
    --exclude="*Rescue*" \
    --exclude="*XFCE*" \
    --exclude="*MicroOS*" \
    --exclude="*Kubic*" \
    --include="*/" \
    --include="*.iso" \
    --include="*.iso.sha256" \
    --include="*.iso.sha256.asc" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest

src="rsync://mirror.leaseweb.com/opensuse/distribution/leap/"
dest="/volume1/mirrors/pub/opensuse/distribution/leap/"
mkdir -p $dest
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
    --exclude="repo" \
    --exclude="appliances" \
    --exclude="iso-devel" \
    --exclude="jeos" \
    --exclude="live" \
    --exclude="microos" \
    --exclude="leap-micro" \
    --exclude="*NET*" \
    --exclude="*aarch64*" \
    --exclude="*ppc64le*" \
    --exclude="*s390x*" \
    --exclude="*Snapshot*" \
    --exclude="*GNOME*" \
    --exclude="*KDE*" \
    --exclude="*Rescue*" \
    --exclude="*XFCE*" \
    --include="*Build*.iso" \
    --include="*Build*.iso.sha256" \
    --exclude="*Media.iso" \
    --exclude="*Media.iso.sha256" \
    --exclude="*Media.iso.sha256.asc" \
    --exclude="*Current.iso" \
    --exclude="*Current.iso.sha256" \
    --exclude="*Current.iso.sha256.asc" \
    --include="*/" \
    --include="*.iso" \
    --include="*.iso.sha256" \
    --include="*.iso.sha256.asc" \
    --exclude="*" \
    --prune-empty-dirs \
    $src \
    $dest
