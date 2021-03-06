echo "CREATE TABLE 'datas' (
    'id'	integer,
    'ot'	integer,
    'alias'	integet,
    'setcode'	INT64,
    'type'	integer,
    'atk'	integer,
    'def'	integer,
    'level'	integer,
    'race'	integer,
    'attribute'	integer,
    'category'	integer,
    PRIMARY KEY(id)
);

CREATE TABLE 'texts' (
    'id'	integer,
    'name'	varchar(128),
    'desc'	varchar(1024),
    'str1'	varchar(256),
    'str2'	varchar(256),
    'str3'	varchar(256),
    'str4'	varchar(256),
    'str5'	varchar(256),
    'str6'	varchar(256),
    'str7'	varchar(256),
    'str8'	varchar(256),
    'str9'	varchar(256),
    'str10'	varchar(256),
    'str11'	varchar(256),
    'str12'	varchar(256),
    'str13'	varchar(256),
    'str14'	varchar(256),
    'str15'	varchar(256),
    'str16'	varchar(256),
    PRIMARY KEY(id)
);

" > emptydb

mkdir build
mkdir build/thumbnail
cd cardgenscripts
ls  > ../cardb.tmp
sed -e "s/.lua//g" ../cardb.tmp > ../cardb
rm ../cardb.tmp
cd ..
echo "#[OpenYGO]" > lflist.conf
echo "!OpenYGO" >> lflist.conf

while [ -s cardb ]; do
line=$(head -n 1 cardb)
cp cardgenscripts/$line.lua ../cardgenerator/data.lua
cp sprites/$line.png ../cardgenerator/sprites/cardgraph.png
cd ../cardgenerator
./runme
cd ../bot-cardcreator
source cardgenscripts/$line.lua
convert /home/$USER/.local/share/love/cardgenerator/$id.png /home/$USER/.local/share/love/cardgenerator/$id.jpg
rm /home/$USER/.local/share/love/cardgenerator/$id.png
mv /home/$USER/.local/share/love/cardgenerator/*.jpg build/
cat /home/$USER/.local/share/love/cardgenerator/aaa >> card-database
sed '1d' cardb > cardb.tmp
rm cardb
rm /home/$USER/.local/share/love/cardgenerator/aa


mv cardb.tmp cardb
cp scripts/$line.lua build/c$id.lua
convert build/$id.jpg -resize 44x64 build/thumbnail/$id.jpg


if [ $limit -lt 3 ]; then
echo $id $limit >> lflist.conf
fi

done

cat emptydb card-database > carddb.tmp
sqlite3 cards.cdb < carddb.tmp
jpegoptim -f build/*.jpg
rm card-database cardb carddb.tmp emptydb
rm ../cardgenerator/data.lua
rm ../cardgenerator/sprites/cardgraph.png