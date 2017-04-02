#!/usr/bin/env zsh
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'

#PROMPT_SUCCESS_COLOR=$FG[117]
PROMPT_SUCCESS_COLOR=$fg[green]
#PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_FAILURE_COLOR=$fg[red]
#PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_VCS_INFO_COLOR=$fg[magenta]
#PROMPT_PROMPT=$FG[077]
PROMPT_PROMPT=$fg[blue]
GIT_DIRTY_COLOR=$fg[red]
GIT_CLEAN_COLOR=$fg[green]
GIT_PROMPT_INFO=$fg[magenta]

TEST="%{$fg[black]%}black%{$reset_color%} %{$fg[red]%}red%{$reset_color%} %{$fg[green]%}green%{$reset_color%} %{$fg[yellow]%}yellow%{$reset_color%} %{$fg[blue]%}blue%{$reset_color%} %{$fg[magenta]%}magenta%{$reset_color%} %{$fg[cyan]%}cyan%{$reset_color%} %{$fg[white]%}white%{$reset_color%}"
TESTB="%{$fg_bold[black]%}black%{$reset_color%} %{$fg_bold[red]%}red%{$reset_color%} %{$fg_bold[green]%}green%{$reset_color%} %{$fg_bold[yellow]%}yellow%{$reset_color%} %{$fg_bold[blue]%}blue%{$reset_color%} %{$fg_bold[magenta]%}magenta%{$reset_color%} %{$fg_bold[cyan]%}cyan%{$reset_color%} %{$fg_bold[white]%}white%{$reset_color%}"

PROMPT='%{$PROMPT_SUCCESS_COLOR%}%n@%m %~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}ᐅ%{$reset_color%} '


#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[magenta]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[magenta]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[magenta]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[yellow]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[cyan]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}✭%{$reset_color%}"
