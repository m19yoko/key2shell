#!/bin/bash

function countargs
{
	echo "$# args."
}

countargs $@
# 上記と結果は同じ
countargs $*

# このシェルだけIFS環境変数を変更（呼び出し元シェルには影響ない）
IFS=,
echo $*
# 上記と結果は同じ
echo $@

