#!/bin/bash

# 引数チェック
# 引数が２個以下だったらエラーとする
if [ $# -le 2 ]; then
	echo "引数の数が足りません"
	exit 1
else
	echo "引数の数が足たりてます"
fi
