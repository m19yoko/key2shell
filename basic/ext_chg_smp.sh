path="/home/cam/book/long.file.name"

echo "元の文字列 ${path}"
# 左端から最長のパターンを削除 long.file.name
echo "ファイル名だけ表示 ${path##/*/}"
# 右端から最短のパターンを削除 /home/cam/book/long.file
echo "拡張子を除いた部分を表示 ${path%.*}"
# 右端から最長のパターンを削除  /home/cam/book/long
echo "ドット以降は全て除いて表示 ${path%%.*}"

