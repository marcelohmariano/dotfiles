#!/bin/bash

editorconfig() {

local root=true

local charset="utf-8"
local end_of_line="lf"
local indent_size=4
local indent_style="space"
local insert_final_newline=false
local trim_trailing_whitespace=true

usage() {
  echo_error -e "Usage: editorconfig [options]\n"
  echo_error -e "Options:\n"
  echo_error -e "  --allow-trailing-whitespace  do not remove whitespaces at the end of lines"
  echo_error -e "  --eof=EOF                    set the end-of-line character for files"
  echo_error -e "  --insert-final-newline       insert new line at the end of files"
  echo_error -e "  --no-root                    do not consider this file as the root EditorConfig file"
  echo_error -e "  --indent-size=SIZE           set the indent size the editor must use"
  echo_error -e "  --indent-style=STYLE         set the indent style (space or tab) the editor must use\n"
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
    --allow-trailing-whitespace)
      trim_trailing_whitespace=false
      ;;
    --eof=*)
      end_of_line="${1#*=}"
      ;;
    --insert-final-newline)
      insert_final_newline=true
      ;;
    --no-root)
      root=false
      ;;
    --indent-size=*)
      indent_size="${1#*=}"
      ;;
    --indent-style=*)
      indent_style="${1#*=}"
      ;;
    *)
      usage
      return 1
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