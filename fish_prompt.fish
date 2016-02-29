function angler_cl_norm; set_color normal; end
function angler_cl_esca; set_color -o 268bd2; end
function angler_cl_off; set_color -o b58900; end
function angler_cl_on; set_color -o dc322f; end
function angler_cl_path; set_color 1b85b8; end
function angler_cl_git; set_color 559e83; end

function angler_dir
	set -l project (command git rev-parse --show-toplevel 2> /dev/null)
	angler_cl_path

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
	angler_cl_norm
end

function angler_branch
	angler_cl_git
	echo -ns " "(command git rev-parse --abbrev-ref HEAD 2> /dev/null)
	angler_cl_norm
end

function angler_lure
	echo -ns (angler_cl_esca)"╭"
	if [ "$argv[1]" -eq 0 ];
		echo -ns (angler_cl_off)"☼  "
	else
		echo -ns (angler_cl_on)"☼⌁ "
	end
	angler_cl_norm
end

function fish_prompt
	angler_lure $status
	angler_dir
	angler_branch
	echo -ns ' '
end