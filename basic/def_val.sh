#!/bin/bash

# 変数var1が未定義またはnullの場合、-より右側の値を返す。但しvar1にはセットされない
# 上記以外の場合、変数の値が返される。
var2="セットしました"
val=${var1:-変数へセットしました}
echo "var1 : $var1"
echo "val : $val"
val=${var2:-変数へセットしました}
echo "val : $val"
# 変数を未定義状態にする
unset var2

# 変数var2が未定義またはnullの場合、=より右側の値を返す。var2にもセットされる
val=${var2:=変数をセットしました}
echo "var2 : $var2"
echo "val : $val"

# 変数を未定義状態にする
unset var1
echo "var1をunsetしました。var1: $var1"
val=""
# 変数var1が未定義またはnullの場合、?より右側の値をメッセージとして表示して終了する。
# 上記以外の場合、変数の値が返される。
val=${var2:?"未定義時にメッセージがでます"}
echo "val : $val"
#val=${var1:?"未定義時にメッセージがでます"}
#echo "val : $val"

# 変数var1が定義されていて、かつnull以外の場合、+より右側の値を返す
# 上記以外の場合はnullを返す
val=${var1:+"定義時に返されます"}
echo "val : $val"
val=${var2:+"定義時に返されます"}
echo "val : $val"

# 文字の切り出し
# 切り出し位置は0始まり ${変数名:切り出し位置:長さ}
val=${var2:1:2}
# 例では2文字目から長さ2文字を切り出す。「数を」と出る
echo "val : $val"

