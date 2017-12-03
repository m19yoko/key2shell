function fncFinally()
{
	echo "実行終了します"
}

trap fncFinally EXIT	# 関数ではなく、コマンドを指定する場合はシングルクォートで囲む
echo "hello! World!"
