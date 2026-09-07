#!/bin/bash
###############################################################################
#
# Arcv - maintenance script to update version nums before release
#
# Copyright (c) 2024-2026 Michel Mehl. All rights reserved.
#
# ------------------------------------------------------------------------------
#
#
# ------------------------------------------------------------------------------
#
# Report bugs to michel.mehl@slashetc.fr
#
###############################################################################
DIRNAME="${BASH_SOURCE[0]%/*}"
MYDIR="$(readlink -f "${DIRNAME}")/.." # This must point to the arcv dir, not the script one's

# Script works fine only if versions of arcv, arcv-test 
#  shellapi and shotplan change all together.
# If this is not the case, the variables may be originally hardcoded
# here. If the var is defined, the matching VERSION.txt won't be read

if [ ! -v ARCV_VERSION ] ; then
    ARCV_VERSION="$(awk -F'.' '{ printf("%s.%s-%s" ,$1,$2,$3);}' "${MYDIR}/../arcv/VERSION.txt")"
fi
if [ ! -v SHELLAPI_VERSION ] ; then
    SHELLAPI_VERSION="$(awk -F'.' '{ printf("%s.%s-%s" ,$1,$2,$3);}' "${MYDIR}/shell-api/VERSION.txt")"
fi

#
# Update version nums in install script
#

processedFile="${MYDIR}/install_arcv.sh"

tmpf=$(mktemp)
cat "${processedFile}" | awk -F"=" \
-v ARCV_VERSION=${ARCV_VERSION} \
-v SHELLAPI_VERSION=${SHELLAPI_VERSION} \
'
{ 
    if (NF == 2) 
    {
        if ($1 == "shellapi_version") {
            print "shellapi_version" "=" SHELLAPI_VERSION
        } else if ($1 == "arcv_version") {
            print "arcv_version" "=" ARCV_VERSION
        } else {
            print $0
        }
    }
    else
    {
        print $0
    }
}
' > "$tmpf"

diff "$tmpf" "${processedFile}" &>/dev/null
if [ $? -ne 0 ] ; then
    echo "Updating $processedFile"
    mv "$tmpf" "$processedFile"
    chmod +x "$processedFile"    
else 
    echo "No change for $processedFile"
    rm "$tmpf"
fi

#
# Update version nums in pack/debian/control
# Depends: ${shlibs:Depends}, ${misc:Depends}, shell-api (=1.1-2)
#

processedFile="${MYDIR}/pack/debian/control"

tmpf=$(mktemp)
cat "${processedFile}" | awk -F":" \
-v ARCV_VERSION=${ARCV_VERSION} \
-v SHELLAPI_VERSION=${SHELLAPI_VERSION} \
'
{ 
    if ($1 == "Depends") {
        print $1 ":" " ${shlibs:Depends}, ${misc:Depends}, " "shell-api (=" SHELLAPI_VERSION ")"
    } else {
        print $0
    }
}
' > "$tmpf"

#cat "$tmpf" # DEBUG

diff "$tmpf" "${processedFile}" &>/dev/null
if [ $? -ne 0 ] ; then
    echo "Updating $processedFile"
    mv "$tmpf" "$processedFile"
else 
    echo "No change for $processedFile"
    rm "$tmpf"
fi


#
# Update version nums in online doc
#

processedFile="/home/michel/riffian/Data/Documents/professionnel/SlashEtc/siteweb/developertoolsforlinux/pages/_topics/arcv/arcv_version.adoc"
tmpf=$(mktemp)
cat "${processedFile}" | awk -F":" \
-v ARCV_VERSION=${ARCV_VERSION} \
-v SHELLAPI_VERSION=${SHELLAPI_VERSION} \
'
{ 
    if ($2 == "shellapi_version") {
        print ":" "shellapi_version" ": " SHELLAPI_VERSION
    } else if ($2 == "arcv_version") {
        print ":" "arcv_version" ": " ARCV_VERSION
    } else {
        print $0
    }
}
' > "$tmpf"

#cat "$tmpf" # DEBUG

diff "$tmpf" "${processedFile}" &>/dev/null
if [ $? -ne 0 ] ; then
    echo "Updating $processedFile"
    mv "$tmpf" "$processedFile"
else 
    echo "No change for $processedFile"
    rm "$tmpf"
fi


#
# There's nothing to update in readme.asciidoc
#
