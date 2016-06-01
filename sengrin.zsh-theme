# ZSH Theme - Modified from Bira
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
#local return_code ="%(?..%{$fg[blue]%}%? a% {$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

#if [${PWD} = ${HOME}]; then
#    echo "Eh?"
#fi


#if $(current_dir) == $(HOME); then
#    echo "worked"
#fi


#If you want a ruby rmv indicator, add in {rmv_ruby}
#\e[0;35mLet us begin living again\e[0.
# \e[1;35m In your absence, you were missed.\e[1;34m Now that you have returned though,\e[1;32m things they are alright.
echo -e "\e[1;31mWelcome home."
 
PROMPT="%F{009}╭─$fg[red][%F{009}%n$fg[red]]%{$reset_color%}%  ${git_branch} %F{005}[${current_dir}%F{005}]
%B%F{009}╰─%B∘%b "
RPS1="─%B∘%b ${return_code}%@ %w  %B∘%b─"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
