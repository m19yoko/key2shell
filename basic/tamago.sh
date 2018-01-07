#!/bin/sh
# 子プロセス開始
echo "start $0"

echo "g_val1@tamago : $g_val1"
echo "g_val2@tamago : $g_val2"

g_val1="tama"
g_val2="gyoku"

if [ -f "$tmp_file" ]; then
	# inの後ろに出力したい変数を列挙する
	#for val in $g_val1 $g_val2 ; do
	#	eval echo "$val=\'\$$val\'" >> $tmp_file
	#done
	echo "g_val1=$g_val1" >> $tmp_file
	echo "g_val2=$g_val2" >> $tmp_file
fi

# 子プロセス終了
echo "end $0"

