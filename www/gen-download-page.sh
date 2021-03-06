#!/bin/sh

project='mtest'
out='www/downloads.html'
remote="http://distfiles.bofc.pl/${project}"

# extract links to files
links="$(curl "${remote}/" 2>/dev/null \
    | grep "${project}-[0-9]*\.[0-9]*\.[0-9]*\." | sort -r)"

exec 1<&-
exec 1<>"${out}"

echo > "${out}"
echo "<h1>downloads</h1>"
echo "<h2>git</h2>"
echo "<p>"
echo "git clone git@git.bofc.pl:${project}<br>"
echo "git clone git://git.bofc.pl/${project}<br>"
echo "git clone http://git.bofc.pl/${project}<br>"
echo "</p>"

echo "<h2>tarballs</h2>"
echo "<pre>"

# convert links to absolute
echo "${links}" | sed "s!a href=\"!a href=\"${remote}/!"
echo "</pre>"
