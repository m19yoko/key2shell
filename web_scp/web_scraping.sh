#!/bin/sh

# Webスクレイピングシェル
# wgetの部分は一応動くが、mail部分はSMTPサーバを指定して
# 動かすように変更しないとちゃんと動かない。

# Target URLs
URLs="	\
	http://www.nttdocomo.co.jp/service/	\
	http://creation.mb.softbank.jp/web/web_ip.html	\
	http://www.ymobile.jp/service/	\
	https://www.au.com/ezfactory/tec/index.html	\
"

# User Configurations
DIR_DOWNLOADTO="$(dirname $0)/work"
MAILTO="$1"
SUBJECT="Web scraping report"

CMD_WGET=$(which wget)
CMD_MD5=$(which md5sum)
CMD_MAIL=$(which mail)

# 事前準備
mkdir -p $DIR_DOWNLOADTO
if [ $? -ne 0 ]; then
	echo "Cannot make a work directory since no mail address specified!" 1>&2
	exit 1
fi

tempfile=$(mktemp /tmp/web_scp_temp.XXXXXX)
if [ -z "$tempfile" ]; then
	echo "Cannot make a temporary file!" 1>&2
	exit 1
fi
echo "Hello, this is Web Scraping tool!" >> $tempfile
echo >> $tempfile
need_to_notify="NO"

# メイン処理
#

# wgetコマンドとmd5コマンドが実行可能な場合のみ処理実施
if [ \( -x "$CMD_WGET" \) -a \( -x "$CMD_MD5" \) ]; then
	echo "Some page got into the state where it is should be reported:" >> $tempfile

	# -- use proxy or not ---
	if [ -n "$HTTP_PROXY" ]; then
		CMD_WGET="env http_proxy=$HTTP_PROXY $CMD_WGET --proxy=on"
	fi
	
	# -- wgetting --
	for url in $URLs; do
		status=""
		filename="${url##*/}"
		subdir="${url#*//}"
		subdir="${subdir%/*}"
		mkdir -p "$DIR_DOWNLOADTO/$subdir"
		if [ -f "$DIR_DOWNLOADTO/$subdir/$filename" ]; then
			md5code_old=$(cat "$DIR_DOWNLOADTO/$subdir/$filename" | $CMD_MD5)
		else
			md5code_old=""
		fi
		result=$($CMD_WGET --cache=off --timestamping --tries=3 \
		         --directory-prefix=$DIR_DOWNLOADTO/$subdir $url 2>&1)
		# -- checking --
		# 注意：チェック処理はwget1.8.2以降でないと不可
		if [ -n "$(echo $result | grep "$filename. saved")" ]; then
			if [ -f "$DIR_DOWNLOADTO/$subdir/$filename" ]; then
				md5code_new=$(cat "$DIR_DOWNLOADTO/$subdir/$filename" | $CMD_MD5)
			else
				md5code_new=""
			fi
			if [ \( -n "$md5code_new" \) -a \( -n "$md5code_old" \) \
			  -a \( "$md5code_old" = "$md5code_new" \) ]; then
				status="NOT_UPDATED"
			else
				status="UPDATED"
			fi
		elif [ -n "$(echo "$result" | grep "no newer than local file")" ]; then
			status="NOT_UPDATED"
		elif [ -n "$(echo "$result" | grep "404 Not Found")" ]; then
			status="NOT_FOUND"
		else
			status="ACCESS_ERROR"
		fi
		#echo $url >> $tempfile
		#echo $result >> $tempfile

		# -- making a report message --
		if [ "$status" = "UPDATED" ]; then
			echo "Updated: $url" >> $tempfile
			need_to_notify="YES"
		elif [ "$status" = "NOT_FOUND" ]; then
			echo "Maybe moved or deleted: $url" >> $tempfile
			need_to_notify="YES"
		elif [ "$status" = "ACCESS_ERROR" ]; then
			echo "Access failed: $url" >> $tempfile
			need_to_notify="YES"
		#elif [ "$status" = "NOT_UPDATED" ]; then
		fi
	done
else
	echo "必要なアプリがインストールされていません" >> $tempfile
fi

# --- Post Handling ---
if [ \( -n "$MAILTO" \) -a \( -x "$CMD_MAIL" \) ]; then
	if [ "$need_to_notify" = "YES" ]; then
		if [ -n "$SUBJECT" ]; then
			cat $tempfile | $CMD_MAIL -s "$SUBJECT" $MAILTO
		else
			cat $tempfile | $CMD_MAIL $MAILTO
		fi
	fi
else
	if [ "$need_to_notify" = "YES" ]; then
		cat $tempfile
	else
		echo "All of web pages are not updated. Nothing to report to you."
	fi
	[ -n $MAILTO ] && echo "メールコマンドが使えません"
fi
rm $tempfile

