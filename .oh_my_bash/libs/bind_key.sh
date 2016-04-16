#!/bin/bash

#Unbind \C-s Stop Key
stty stop undef

declare -A KEY

KEY=(
		[CTRL]="\C"
		[META]="\e"
		[ENTER]="\n"
    )

#string="'\"\C-i\":\"begin\C-m\"'"

emacs_key="\"${KEY[META]}e\":\"emacscl${KEY[ENTER]}\""
git_status="\"${KEY[CTRL]}-s\":\"gs${KEY[ENTER]}\""
tmux_key="\"${KEY[CTRL]}-t\":\"tmux${KEY[ENTER]}\""

bind $tmux_key
bind $emacs_key
bind $git_status

# Road Map -- Use key-bind function to declare custom modifications in user custom custom_conf file.
#KEY-BIND META i begin
#KEY-BIND CTRL s git status
