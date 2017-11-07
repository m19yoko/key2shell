function lsd
{
	dt=$1
	stp=29	# ls-lコマンドの日付の開始位置
	etp=42  # ファイル名の開始位置
	ls -l | grep -i "^.\{${stp}\}$dt" | cut -c${etp}-
}
