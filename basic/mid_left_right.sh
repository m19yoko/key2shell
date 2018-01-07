#!/bin/sh
# mid関数
#  第一引数：対象文字列
#  第二引数：開始位置
#  第三引数：終了位置
mid()
{
	local str=$1
	local st_pos=$2
	local ed_pos=$3

	cut_str=$(echo "$str" | cut -c ${st_pos}-${ed_pos}) 
	echo $cut_str
}

# left関数
#  第一引数：対象文字列
#  第二引数：左から何文字切り出すか
left()
{
	local str=$1
	local pos=$2

	cut_str=$(echo "$str" | cut -c -${pos}) 
	echo $cut_str
}

# right関数
#  第一引数：対象文字列
#  第二引数：右から何文字切り出すか
right()
{
	local str=$1
	local pos=$2

	cut_str=$(echo "$str" | cut -c $((${#str} + 1 - $pos))-) 
	echo $cut_str
}

string="あかさたなはまやらわ"
echo "実行前の文字列：$string"
echo "先頭から２〜３文字目を切り出す"
echo $(mid $string 2 3)
echo "左から４文字までを切り出す"
echo $(left $string 4)
echo "右から３文字までを切り出す"
echo $(right $string 3)

