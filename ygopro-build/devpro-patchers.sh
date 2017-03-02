#!/bin/sh

wget http://www.ygodev.pro/launcher/installers/YGOPro%20DevPro.exe
unar YGOPro\ DevPro.exe
rm YGOPro\ DevPro.exe
cd YGOPro\ DevPro
cp strings.conf ../binaries/strings.conf
cp cards.cdb ../binaries/cards.cdb
