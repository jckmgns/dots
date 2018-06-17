local user_host='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}@%{$terminfo[bold]$fg[green]%}%m%{$reset_color%} '
local current_dir='%{$terminfo[bold]$fg[blue]%}$(shrink_path -f)%{$reset_color%} '

local git_branch='$(git_prompt_info)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"

local user_symbol='%%'

PROMPT="${user_host}${current_dir}${git_branch}${user_symbol} "

# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# RPS1="%B${return_code}%b"

## vim:ft=zsh
