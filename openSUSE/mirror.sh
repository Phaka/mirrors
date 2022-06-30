#!/bin/bash
set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
src="rsync://mirror.leaseweb.com/opensuse/tumbleweed/"
dest="/volume1/mirrors/pub/opensuse/tumbleweed/"
mkdir -p $dest
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
    --cvs-exclude \
    --safe-links --copy-links --hard-links \
    --fuzzy \
    --exclude-from="$SCRIPT_DIR/../exclude-arch.txt" \
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
