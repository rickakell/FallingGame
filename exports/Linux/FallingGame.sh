#!/bin/sh
printf '\033c\033]0;%s\a' FallingGame
base_path="$(dirname "$(realpath "$0")")"
"$base_path/FallingGame.x86_64" "$@"
