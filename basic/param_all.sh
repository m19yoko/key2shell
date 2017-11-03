#!/bin/bash

function countargs
{
	echo "$# args."
}

countargs "$@"
# 一つの引数として認識されてしましう
countargs "$*"

# このシェルだけIFS環境変数を変更（呼び出し元シェルには影響ない）
IFS=,
# 区切り文字が変換されて出力される
echo "$*"
echo "$@"

