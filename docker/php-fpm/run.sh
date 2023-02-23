#!/usr/bin/env bash
export PS1="\[\033[38;5;36m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;38m\]\h\[$(tput sgr0)\] > \[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]"