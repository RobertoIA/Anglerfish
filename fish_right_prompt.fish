function angler_elapsed
	if [ "$CMD_DURATION" -lt 100 ]; return
	else if [ "$CMD_DURATION" -lt 1000 ]
		echo -ns $CMD_DURATION'ms'
	else if [ "$CMD_DURATION" -lt 60000 ]
		echo -ns (math "scale=1;$CMD_DURATION/1000")'s'
	else if [ "$CMD_DURATION" -lt 3600000 ]
		echo -ns (math "scale=1;$CMD_DURATION/60000")'m'
	else
		echo -ns (math "scale=1;$CMD_DURATION/3600000")'h'
	end
end

function angler_current
	echo -ns (date +%H:%M:%S)
end

function angler_pyenv
	if test "$VIRTUAL_ENV"
		echo -ns ''(basename "$VIRTUAL_ENV")''
	end
end

function fish_right_prompt
	set -l elapsed (angler_elapsed)
	set -l current (angler_current)
	set -l pyenv (angler_pyenv)

	printf "$elapsed $pyenv $current"
end