#!/bin/bash

# 状態変数いろいろ

# ホームディレクトリを表示
echo $HOME
# シェルを呼び出してからの秒数
echo $SECONDS
# 実行中のシェルのパス名
echo $BASH
# 実行中のシェルのバージョン番号
echo $BASH_VERSION
# カレントディレクトリ
echo $PWD
base_path=$PWD
cd ../
cd ../
# 一つ前のカレントディレクトリ
echo $OLDPWD
# 変数の宣言とエクスポートを同時にする
export www2="hahaha"
echo "環境変数 www2 を定義した ${www2}"
# test.shでwww2を呼び出しても使用できる。
# ただし、www2はこれを呼び出したセッションからは参照できない。
# cd $base_path
# ./test.sh

# 標準変数いろいろ
# ディスプレイの列数(shell上からは表示されない)
echo $COLUMNS
# テキストエディタのパス名
echo $EDITOR
# ディスプレイの行数(shell上からは表示されない)
echo $LINES
# シェルのパス名
echo $SHELL
# 使用している端末の種類
echo $TERM


