path="/home/cam/book/long.file.name"

echo "元の文字列 ${path}"
# basenameコマンドと同じ結果 long.file.name
echo "basenameコマンドと同じ結果 ${path##*/}"
# dirnameコマンドと同じ結果 /home/cam/book
echo "dirnameコマンドと同じ結果 ${path%/*}"
# 左端から最長のパターンを削除 long.file.name
echo "ファイル名だけ表示 ${path##/*/}"
# 左端から最短のパターンを削除 cam/book/long.file.name
echo "最上位のディレクトリを削除して表示 ${path#/*/}"
# 右端から最短のパターンを削除 /home/cam/book/long.file
echo "拡張子を除いた部分を表示 ${path%.*}"
# 右端から最長のパターンを削除  /home/cam/book/long
echo "ドット以降は全て除いて表示 ${path%%.*}"
# 一部を置換して表示(最初にヒットした文字のみ) /home/cam/book/short.file.name
echo "long => short ${path/long/short}"
# 一部を置換して表示(ヒットした全て文字を置換) /home/cam/book/short.file.name
echo "am => pm ${path//am/pm}"
# 拡張子を表示 name
echo "extension ${path##*.}"

