#!/bin/sh

cd scripts
ls  > ../cardb.tmp
sed -e "s/.lua//g" ../cardb.tmp > ../cardb
