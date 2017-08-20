cd /home/yoko/dev/key2shell/basic
cd /home
# 一つ前のカレントディレクトリへ移動
cd -

# 拡張子がtxt、shのファイルのみ表示
echo "拡張子がtxt、shのみ表示"
ls *.{txt,sh} 2> /dev/null

# /etc/passwdの一列目だけ表示
echo "/etc/passwdの一列目だけをソートして表示"
cut -d: -f1 < /etc/passwd | sort
