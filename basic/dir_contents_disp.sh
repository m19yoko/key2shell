#!/bin/bash

dpath=$1
fext=$2

# NULLチェックする
if [ -z ${dpath} ]; then
	echo "ディレクトリを指定して下さい"
	exit 0
fi

if [ -z ${fext} ]; then
	echo "拡張子を指定して下さい"
	exit 0
fi

# コマンド呼び出しは$(command)でできる
for filenm in $(ls -1 *.${fext}) ; do
  echo $filenm
done

