#!/bin/bash

fpath=$1

# NULLチェックする
if [ -z ${fpath} ]; then
	echo "パスを指定して下さい"
	exit 0
fi

# ファイル存在チェックをする
if [ -f ${fpath} ]; then
  echo "ファイルあります"
else
  echo "ファイルありません"
fi

# if文が[-d]だったらディレクトリ存在チェック
# if文が[-w]だったら書き込み権限有無チェック
# if文が[-r]だったら読み込み権限有無チェック
