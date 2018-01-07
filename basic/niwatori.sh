#!/bin/sh

g_val1="sato"
g_val2="shio"

# 一時ファイルを作成
tmp_file=$(mktemp /tmp/key2shell_tmp_XXXXX)
#tmp_file="./tmp.tmp"
#touch $tmp_file
export tmp_file
export g_val1
export g_val2

# 子プロセス起動
./tamago.sh

# 復帰後、子プロセスで設定された内容を読み込む
for val in $(cat $tmp_file) ; do
	eval $val
done

rm -f $tmp_file

echo "g_val1@niwatori : $g_val1"
echo "g_val2@niwatori : $g_val2"
