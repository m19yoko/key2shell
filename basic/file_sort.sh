#!/bin/bash

# ファイルを先頭の番号が大きい順に並び替え

# ファイルの内容 
# 1		sly & FamilyStone
# 4 	ELP
# 2		Yes
# 10	King Crimson

# 実行結果
# 10	King Crimson
# 4 	ELP
# 2		Yes
# 1		sly & FamilyStone

filename=$1
filename=${filename:?"missing."}	# 変数filenameがNULLの時エラーとなる
howmany=${2:-10}	# 第二引数がNULLの場合、10を返す

# 先頭を数値と判定し、降順にソートし、howmany行出力
sort -nr $filename | head -$howmany

