function angler_dir
	set -l project (command git rev-parse --show-toplevel 2> /dev/null)

	if [ -n "$project" ]
		set -l path (echo -ns "$project" | sed -e 's/.*\///g')
		set -l folder (echo -ns (pwd) | sed -e "s#$project##g" -e 's#^/##')
		
		if [ -n "$folder" ]
			set -l short_path (echo -ns "$path/$folder" | sed -e "s/\([^\/]\)[^\/]*\//\1\//g")
			echo -ns "$short_path "
		else
			echo -ns "$path "
		end
	else
		echo -ns (prompt_pwd)" "
	end
end

function angler_branch
	echo -ns " "(command git rev-parse --abbrev-ref HEAD 2> /dev/null)
end

function angler_lure
	echo -ns (set_color blue)"╭"
	if [ "$argv[1]" -eq 0 ];
		echo -ns (set_color yellow)"☼ "
	else
		echo -ns (set_color red)"☼ "
	end
	set_color normal
end

function fish_prompt
	angler_lure $status
	angler_dir
	angler_branch
	echo -ns ' '
end