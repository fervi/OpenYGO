cd cardgenscripts
ls  > ../cardb.tmp
sed -e "s/.lua//g" ../cardb.tmp > ../cardb
rm ../cardb.tmp
cd ..
