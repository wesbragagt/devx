# DevX

## ⚠️ Watch

What you are about to see is guaranteed to give you a blazingly fast results!

## What?

DevX is a utility script that integrates with fzf,ripgrep and bat for fast filesystem navigation and editing.

## Why?

Imagine you ssh into a server that you are not very familiar and the standard navigation just seems too slow. Well now you can utilize this tool to give you a boost.

## Getting Started

### Requires

- curl
- apt (other package managers to be supported)

```
curl -s https://raw.githubusercontent.com/wesbragagt/devx/main/main.sh > ~/devx.sh && source ~/devx.sh
```

## Installs the following

- ripgrep
- fzf
- bat
- git

## Adds the following aliases

- fa (fuzzy search through all files in the current directory excluding .git and node_modules and will opens the selected file in the EDITOR of choice. default to vim)
  <TBD example giph>

- fp (searches for a string passed in the current directory excluding .git and node_modules and will opens the selected file in the EDITOR of choice. default to vim)
  <TBD example giph>

- cdl (fuzzy searches through all files in the current directory and cd into the directory of the selected file)
  <TBD example giph>

- cd/ (cd into the .git root of the current directory)
  <TBD example giph>

## Important

The aliases and functions used in the script will not persist across different session. If you want those to persist just copy them into your .bash-profile or .zshrc
