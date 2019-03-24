#!/bin/bash

editorconfig() {

local root=false

local charset="utf-8"
local end_of_line="lf"
local indent_size=4
local indent_style="space"
local insert_final_newline=false
local trim_trailing_whitespace=true

usage() {
  echo_error -e "Usage: editorconfig [options]\n"
  echo_error -e "Options:\n"
  echo_error -e "  --root=<true|false>: set 'root' property. (Default: ${root})"
  echo_error -e "  --eof=<lf|cr|crlf>: set 'end_of_line' property. (Default: ${end_of_line})"
  echo_error -e "  --tabsize=<size>: set 'indent_size' property. (Default: ${indent_size})"
  echo_error -e "  --tabstyle=<space|tab>: set 'indent_style' property. (Default: ${indent_style})"
  echo_error -e "  --newline=<true|false>: set 'insert_final_newline' property. (Default: ${insert_final_newline})"
  echo_error -e "  --no-whitespace=<true|false>: set 'trim_trailing_whitespace' property. (Default: ${trim_trailing_whitespace})\n"
}

while [ ! -z "$1" ]; do

  # Test if option value is empty
  if [ -z "${1#*=}" ]; then
    usage
    return 1
  fi

  case $1 in
    -h|--help)
      usage
      return 1
      ;;
    --root=*)
      root="${1#*=}"
      ;;
    --eof=*)
      end_of_line="${1#*=}"
      ;;
    --tabsize=*)
      indent_size="${1#*=}"
      ;;
    --tabstyle=*)
      indent_style="${1#*=}"
      ;;
    --newline=*)
      insert_final_newline="${1#*=}"
      ;;
    --no-whitespace=*)
      trim_trailing_whitespace="${1#*=}"
      ;;
  esac

  shift
done

cat <<EOF > .editorconfig
root = ${root}

[*]
charset = ${charset}
end_of_line = ${end_of_line}
indent_size = ${indent_size}
indent_style = ${indent_style}
insert_final_newline = ${insert_final_newline}
trim_trailing_whitespace = ${trim_trailing_whitespace}
EOF

}