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
cd ../
cd ../
# 一つ前のカレントディレクトリ
echo $OLDPWD
