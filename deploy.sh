#!/bin/bash

read -p 'Noi dung commit: ' commitVar
git add -A .
git commit -m """$commitVar""" --allow-empty
git push

gitCommit=`git rev-parse HEAD`
link="https://raw.githubusercontent.com/DungSherlock/ggTrans/${gitCommit}/source.txt"

echo $link
exit
echo '[InternetShortcut]\
URL='$link > ggTrans.url
open -a "Microsoft Edge" ggTrans.url
exit

