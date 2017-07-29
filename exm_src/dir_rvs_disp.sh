#!/bin/bash

# ディレクトリの中身を再帰的に表示
recls()
{
  singletab="\t"

  for tryfile in "$@"; do
    echo $tryfile
    if [ -d $tryfile ]; then
      thisfile=$tryfile
      recdir $(command ls $tryfile)
    fi  
  done

	# 変数を削除
  unset dir singletab tab
}

# ディレクトリの中身を表示する関数。再帰的に呼ばれる
recdir()
{
  tab=${tab}${singletab}

  for file in "$@"; do  
    echo -e $tab$file
    thisfile=${thisfile}/${file}

    if [ -d "$thisfile" ]; then
			# lsの前にcommandをつけているのは内部コマンドのlsを呼ぶため。
			# たまにlsにエイリアスを設定してることがあるから。
      recdir $(command ls $thisfile)
    fi  

    thisfile=${thisfile%/*}
  done

  tab=${tab%"$singletab"}
}

recls "$@"

