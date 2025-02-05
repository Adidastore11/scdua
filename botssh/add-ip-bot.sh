#!/bin/bash

echo -e ""
read -p "Input ipvps    :   " ipqu
CLIENT_EXISTS=$(grep -w $ipqu /root/izinvps/ip | wc -l)

if [[ ${CLIENT_EXISTS} == '1' ]]; then
    echo "ipqu Already Exist !"
    rm -rf /root/izinvps
    exit 0
fi

echo -e ""
read -p "Input username : " name
echo -e ""

clear
echo -e "Pilih waktu expired:"
echo -e "1. 30 days"
echo -e "2. 60 days"
echo -e "3. 90 days"
echo -e "4. Lifetime"

read -p "Masukkan nomor pilihan: " exp_option

case $exp_option in
    1)
        exp="30"
        ;;
    2)
        exp="60"
        ;;
    3)
        exp="90"
        ;;
    4)
        exp="360"
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

exp2=`date -d "${exp} days" +"%Y-%m-%d"`
echo "### ${name} ${exp2} ${ipqu}" >> /root/izinvps/ip

