#!/bin/bash

# read -p 'Noi dung commit: ' commitVar
git add -A .
git commit -m "ggTrans" --allow-empty
git push

gitCommit=`git rev-parse HEAD`
# link="https://raw-githubusercontent-com.translate.goog/DungSherlock/ggTrans/${gitCommit}/source.txt?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=wapp"


for file in *.vtt; do
    if [ -e "$file" ]; then
        link="https://raw-githubusercontent-com.translate.goog/DungSherlock/ggTrans/${gitCommit}/${file}?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=wapp"
        echo '[InternetShortcut]\
        URL='$link > ${file}.url
        open -a "Microsoft Edge" ${file}.url
        open -a "Microsoft Edge" ${file}.url
    fi
done