#!/bin/bash
folder_name="Bibalo_DeNardi_Giunta"
archive_name="ProgettoSocCom2_p1_Bibalo_DeNardi_Giunta.zip"

tmp_folder=$(mktemp -d --tmpdir=.)

mkdir ${tmp_folder}/${folder_name} 

cp -rl Relazione_p1.pdf build tweets.json README.md ${tmp_folder}/${folder_name}

pushd $tmp_folder
zip -r ../${archive_name} ${folder_name}
popd

rm -rf ${tmp_folder}
