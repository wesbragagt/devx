#!/usr/bin/env/bash

# Setup nice utilities to navigate through a filesystem and edit files at the speed of thought

# Currently for use with apt package manager

export editor_to_use=${EDITOR:-"vim"}
alias vi=$editor_to_use

i_preinstall(){
  apt update -y
}

i_ripgrep(){
  command -v "rg" || apt install ripgrep -y
}

i_fzf(){
  command -v "fzf" || apt install fzf -y
}

i_bat(){
  command -v "bat" || apt install bat -y
}

i_git(){
  command -v "git" || apt install git -y
}

export FZF_DEFAULT_COMMAND='rg --files --hidden --no-require-git --follow --glob "!.git/*" --glob "!node_modules/*"'

# aliases
fa(){
  if [[ $# -eq 1 ]]; then
      selected=$1
  else
      if command -v bat &> /dev/null; then
        selected=`fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'`
      else
        selected=`fzf`
      fi
  fi

  if [[ -z $selected ]]; then
          echo "nothing to selected"
  else
          vim $selected
  fi
}

fp(){
  items=`rg -l --hidden -g '!.git/' $@`
  selected=`echo "$items" | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'`

  if [[ -z $selected ]]; then
          echo "nothing to selected"
  else
          vim $selected
  fi
}


cdl(){
  cd $(dirname `fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'`)
}

cd/(){
  cd $(git rev-parse --show-toplevel)
}

i_preinstall
i_ripgrep
i_fzf
i_bat
i_git
