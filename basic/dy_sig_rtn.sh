function fncFinally()
{
	echo "関数終了します"
}


trap fncFinally RETURN	# 関数ではなく、コマンドを指定する場合はシングルクォートで囲む
echo "shell start!"
. dy_src.sh             # sourceコマンドが呼ばれた後にtrapで指定した関数が呼ばれる
hello   
echo "shell end!"

