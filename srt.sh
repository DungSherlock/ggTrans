#!/bin/bash

# read -p 'Noi dung commit: ' commitVar

for file in *.srt; do
    if [ -e "$file" ]; then
        # Lấy tên tệp (không bao gồm phần mở rộng)
        fileName="${file%.*}"
        # Loại bỏ dấu cách và ký tự đặc biệt bằng cách thay thế chúng bằng dấu gạch dưới
        newFile=$(echo "${fileName}" | sed -e 's/[^A-Za-z0-9._-]/_/g')
        # Đổi tên tệp .srt thành tên mới
        mv "${file}" "$newFile.srt"
    fi
done

git add -A .
git commit -m "ggTrans" --allow-empty
git push
gitCommit=`git rev-parse HEAD`


for file in *.srt; do
    if [ -e "$file" ]; then
        link="https://raw-githubusercontent-com.translate.goog/DungSherlock/ggTrans/${gitCommit}/${file}?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=wapp"
        echo "[InternetShortcut]
URL=${link}" > "${file%.*}".url
        open -a "Microsoft Edge" ${file%.*}.url
    fi
done

rm -f *.url
read -p "Press any key to continue... " -n1 -s
rm -f *.srt
git push