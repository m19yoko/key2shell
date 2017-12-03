function fncFinally
{
	var=$?
	lin_no=$1
	echo "異常終了します エラーコード：${var} 行数：${lin_no}"
	exit $var  # エラーが起こった場所で終了させるにはこれが必要
}

function chkParam
{
	if [ $1 -ne 0 ]; then
		return 127
	fi
}
# 関数に引数を渡す場合、またはコマンドを指定する場合は
# シングルクォートで囲む
# $LINENOにはreturn文、またはエラーを返したコマンドの行数が格納される
trap 'fncFinally $LINENO' ERR
								
echo "hello! World!"
chkParam "$#"
echo "Check OK!"
