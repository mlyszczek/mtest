#!/bin/sh

file_list="example man www LICENSE Makefile dist.sh man2html.sh mtest.h \
    mtest.sh readme.md gen-download-page.sh"

dname="mtest-$(cat version)"

mkdir "${dname}"
cp -r ${file_list} "${dname}"
tar -czf "${dname}.tar.gz" "${dname}"
sha1sum "${dname}.tar.gz" > "${dname}.tar.gz.sha1"
rm -rf "${dname}"
