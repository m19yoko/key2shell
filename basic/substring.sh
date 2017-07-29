#!/bin/bash

var1=$1
var2=$2

# var1がnullだったらvar1値をセット
echo ${var1:="default Value"}
echo "２文字目〜４文字目 ${var1:1:3}"
# var2がnullだったら1を返す
echo ${var2:-1}

