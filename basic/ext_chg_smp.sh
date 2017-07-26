path="/home/cam/book/long.file.name"

echo "元の文字列 ${path}"
echo "ファイル名だけ表示 ${path##/*/}"
echo "拡張子を除いた部分を表示 ${path%.*}"
echo "ドット以降は全て除いて表示 ${path%%.*}"

