#!/bin/sh

number=0
tmp_file=$(mktemp /tmp/proclist.XXXXXX)

ps ax -o "pid ucomm" > $tmp_file

# オリジナルの標準入力（0番ポート）を3番ポートに退避
# 0番ポートにtmpファイルを接続
exec 3<&0 < $tmp_file
# tmpファイルに変更された標準入力より1行ずつ読み込む
while read line; do
	pid=$(echo "$line" | awk "{print \$1}")
	[ -n "$(echo "$pid" | grep "[^0-9]")" ] && continue
	#$((number++))
	number=$(($number+1))
	cmd=$(echo "$line" | awk "{print \$2}")
	printf "#%-3d : pid=%s\n is %s\n" $number $pid "$cmd"
done

# 標準入力を元に戻す
exec 0<&3 3<&-
[ -f "$tmp_file" ] && rm -f $tmp_file # テンポラリを削除
# while read lineでパイプを使わないとブロック外でも参照できる。
# パイプを使った場合は$numberは参照できない。
echo "The number of processes is ${number}."
