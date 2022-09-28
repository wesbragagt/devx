#!/usr/bin/env/bash

alias vi="vim"

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

# aliases
fa(){
  if [[ $# -eq 1 ]]; then
      selected=$1
  else
      # with a preview window
      if command -v bat &> /dev/null; then
        selected=`fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'`
      else
        selected=`fzf`
      fi

  fi

  vim $selected
  if [[ $? -eq 0 ]]; then
      exit 0
  fi
}

fp(){
  items=`rg -l --hidden -g '!.git/' $@`
  selected=`echo "$items" | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'`

  vim $selected
  if [[ $? -eq 0 ]]; then
      exit 0
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
