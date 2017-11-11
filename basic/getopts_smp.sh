#!/bin/bash

while getopts ":ab:c:" opt; do	# オプション文字列後に:があるとオプション引数がとれる
	case $opt in
		a ) 
			echo "aオプションが指定されました" ;;
		b ) 
			echo "bオプションが指定されました"
			echo "オプション引数${OPTARG}が指定されました" ;;
		c ) 
			echo "bオプションが指定されました"
			echo "オプション引数${OPTARG}が指定されました" ;;
		\? ) 
			echo "無効なオプションです" ;;
	esac
done

# オプション部分を詰める
shift $(($OPTIND -1))

echo "最初の引数は${1}"
