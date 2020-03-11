#!/bin/sh -l

c_path=$1
c_action=$2
c_password=$3

function dec_file() {
  openssl enc -d -aes256 -k ${c_password} -in $line -out "${1::-4}";
  rm -f $1;
}

function enc_file() {
  openssl enc -e -aes256 -k ${c_password} -in $line -out "${1}.enc";
  rm -f $1;
}

function dec_dir() {
  find $1 -type f -name '*.enc' | while read line; do
    dec_file $line
  done
}

function enc_dir() {
  find $1 -type f ! -name '*.enc' | while read line; do
    enc_file $line;
  done
}

if [[ -d $c_path ]]; then
  "$c_action" == "enc" && enc_dir $c_path || dec_dir $c_path
else
  "$c_action" == "enc" && enc_file $c_path || dnc_file $c_path
fi
