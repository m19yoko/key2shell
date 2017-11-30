# ctrl-c を押下すると下のメッセージが出る
trap "echo 'You hit CTRL+C!'" INT
# kill -15 [PID]  のコマンドを打つと、下のメッセージが出る
trap "echo 'You tried to kill me!'" TERM
# trap - INT TERM  とすれば、INTシグナルとTERMシグナルがリセットされる

while true; do
	sleep 60
done
