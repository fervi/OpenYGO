while [ -s cardb ]; do
line=$(head -n 1 cardb)
cp cardgenscripts/$line.lua ../cardgenerator/data.lua
cp sprites/$line.png ../cardgenerator/sprites/cardgraph.png
cd ../cardgenerator
./runme
cd ../bot-cardcreator
mv /home/$USER/.local/share/love/cardgenerator/*.jpg build/
cat /home/$USER/.local/share/love/cardgenerator/aaa >> card-database
sed '1d' cardb > cardb.tmp
rm cardb
rm /home/$USER/.local/share/love/cardgenerator/aa
mv cardb.tmp cardb
done