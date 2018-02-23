#!/bin/sh

#
# OS/2 Version Reviser
#
# Copyright (c) 2011-2014, Yasunori Yusa <yyusa at rs.tus.ac.jp>
# All rights reserved.
#
# This script is to revise OS/2 Version of Ricty.
# If the spaces between fullwidth charcters are unusually large,
# you can use this script and revise it.
#
# Usage:
usage="Usage: os2version_reviser.sh filename.ttf ..."
#

fontforge_cmd="fontforge"
os2_version="1"

if [ $# -eq 0 ]
then
    echo $usage
    exit 0
fi

# Make tmp
if [ -w "/tmp" ]
then
    tmpdir=`mktemp -d /tmp/os2version_reviser_tmpdir.XXXXXX`
else
    tmpdir=`mktemp -d ./os2version_reviser_tmpdir.XXXXXX`
fi

# Remove tmp by trapping
trap "if [ -d $tmpdir ]; then rm -rf $tmpdir; fi" EXIT HUP INT QUIT

# Args loop
for filename in $@
do
    # Generate scripts
    cat > ${tmpdir}/ttf2sfd.pe << _EOT_
#!$fontforge_cmd -script
Open("${filename}")
Save("${tmpdir}/tmpsfd.sfd")
_EOT_
    cat > ${tmpdir}/sfd2ttf.pe << _EOT_
#!$fontforge_cmd -script
Open("${tmpdir}/tmpsfd2.sfd")
Generate("${filename}", "", 0x84)
_EOT_
    # Convert file
    $fontforge_cmd -script ${tmpdir}/ttf2sfd.pe 2> /dev/null
    sed -e "s/^OS2Version: .*$/OS2Version: ${os2_version}/" \
        ${tmpdir}/tmpsfd.sfd > ${tmpdir}/tmpsfd2.sfd
    mv -f $filename $filename.bak
    $fontforge_cmd -script ${tmpdir}/sfd2ttf.pe 2> /dev/null
done
