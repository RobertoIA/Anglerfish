function angler_color_test; set_color -o fee; end

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

function fish_right_prompt
	set -l elapsed (angler_elapsed)
	set -l current (angler_current)

	printf (angler_color_test)"$elapsed $current"
end