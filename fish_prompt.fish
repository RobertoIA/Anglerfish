function angler_dir
	set -l project (command git rev-parse --show-toplevel 2> /dev/null)

	if [ -n "$project" ]
		set -l path (echo -ns "$project" | sed -e 's/.*\///g')
		set -l folder (echo -ns (pwd) | sed -e "s#$project##g" -e 's#^/##')
		
		if [ -n "$folder" ]
			set -l short_path (echo -ns "$path/$folder" | sed -e "s/\([^\/]\)[^\/]*\//\1\//g")
			echo -ns "$short_path"
		else
			echo -ns "$path"
		end
	else
		echo -ns (prompt_pwd)
	end
end

function fish_prompt
	printf (set_color blue)"╭"(set_color yellow)"☼ "(set_color normal)(angler_dir)" "
end