#!/bin/bash

installer::install() {
  test -z "$1" && return

  local fullpath
  local dotfile

  for file in "$@"; do
    fullpath="$(realpath "$file")"
    dotfile="$HOME/.$(basename "$file")"
    rm -f "$dotfile"
    ln -vs "$fullpath" "$dotfile"
  done
}

installer::uninstall() {
  test -z "$1" && return

  local fullpath
  local dotfile

  for file in "$@"; do
    dotfile="$HOME/.$(basename "$file")"
    echo \'rm -f "$dotfile"\'
    rm -f "$dotfile"
  done
}