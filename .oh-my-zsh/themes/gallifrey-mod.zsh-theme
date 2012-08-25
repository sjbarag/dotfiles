# ZSH Theme - Preview: http://img.skitch.com/20091113-qqtd3j8xinysujg5ugrsbr7x1y.jpg
PROMPT='%{$fg[green]%}%m%{$reset_color%} :: %2~ %(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})$%{$reset_color%} '
RPROMPT='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}[+]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
