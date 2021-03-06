#!/bin/bash
####################################################
#
#  fixme.sh
#  Intended to remove the use of libtool's 
#  pseudo-libraries for opencsw builds.
#
#  Author: Mike Watters  mwatters_at_opencsw.org
#  Initial Version: 0.1
#
####################################################

umask 0022
PATH=/opt/csw/bin

if [ $# -ne 1 ]; then
    gecho "USAGE: $(basename $0) WORKSRC"
    exit 1
fi
BASEPATH=$1

## Fix Makefiles
for mk in $(gfind ${BASEPATH} -name Makefile -print); do
    LT_FILES=$(ggrep '/opt/csw.*/lib/.*\.la' ${mk} | \
        gsed "s/^.*\(\/opt\/csw.*\/lib\/.*\.la\).*$/\1/")
    
    for file in ${LT_FILES}; do
        LIB_NAME=$(ggrep 'dlname=' ${file} | \
            gsed -e "s/.*'\(.*\)'/\1/" \
                -e "s/^lib//" \
                -e "s/\.so.*$//")
        fixpath=$(gecho $file |gsed 's/\//\\\//g')
        gsed "s/${fixpath}/-l${LIB_NAME}/g" ${mk} >Makefile.new
        gmv Makefile.new ${mk}
        gchmod +x ${mk}
    done
done

## Fix libtool Script
for lt in $(gfind ${BASEPATH} -name libtool -print); do
    gsed "/for search_ext in .*\.la/s/\.la//" ${lt} >${lt}.new
    gmv ${lt}.new ${lt}
    gchmod +x ${lt}
done

for LTMAIN in $(gfind ${BASEPATH} -name ltmain.sh -print); do
    gsed "/for search_ext in .*\.la/s/\.la//" ${LTMAIN} >${LTMAIN}.new
    gmv ${LTMAIN}.new ${LTMAIN}
    gchmod +x ${LTMAIN}
done

