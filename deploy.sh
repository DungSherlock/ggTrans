#!/bin/bash

read -p 'Noi dung commit: ' commitVar
git add -A .
git commit -m """$commitVar""" --allow-empty
git push

gitCommit=`git rev-parse HEAD`
link="https://raw-githubusercontent-com.translate.goog/DungSherlock/ggTrans/${gitCommit}/source.txt?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=wapp"

echo '[InternetShortcut]\
URL='$link > ggTrans.url
open -a "Microsoft Edge" ggTrans.url
exit