#!/bin/bash

runner::run() (
  test -z "$1" && return
  test -z "$2" && return

  local action="$2"

  local script
  local namespace
  local directory

  script="$(basename "$1")"
  namespace="$(basename -s .sh "$1")"
  directory="$(dirname "$(realpath "$1")")"

  cd "$directory" || return 1

  # shellcheck disable=SC1090
  source "$script"

  # shellcheck disable=2086
  $namespace::$action
)