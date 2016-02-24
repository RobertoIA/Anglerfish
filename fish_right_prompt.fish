function angler_color_test; set_color -o fee; end

function fish_right_prompt
	if [ "$CMD_DURATION" -lt 100 ]
		printf (angler_color_test)' '
	else if [ "$CMD_DURATION" -lt 1000 ]
		printf (angler_color_test)$CMD_DURATION'ms '
	else if [ "$CMD_DURATION" -lt 60000 ]
		printf (angler_color_test)(math "scale=1;$CMD_DURATION/1000")'s '
	else if [ "$CMD_DURATION" -lt 3600000 ]
		printf (angler_color_test)(math "scale=1;$CMD_DURATION/60000")'m '
	else
		printf (angler_color_test)(math "scale=1;$CMD_DURATION/3600000")'h '
	end

	printf (date +%H:%M:%S)
end