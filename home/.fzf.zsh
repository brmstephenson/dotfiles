# Setup fzf
# ---------
if [[ ! "$PATH" == */home/adam/.fzf/bin* ]]; then
  export PATH="$PATH:/home/adam/.fzf/bin"
fi
if [[ ! "$PATH" == */home/acb29/.fzf/bin* ]]; then
  export PATH="$PATH:/home/acb29/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/adam/.fzf/man* && -d "/home/adam/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/adam/.fzf/man"
fi
if [[ ! "$MANPATH" == */home/acb29/.fzf/man* && -d "/home/acb29/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/acb29/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/adam/.fzf/shell/completion.zsh" 2> /dev/null
[[ $- == *i* ]] && source "/home/acb29/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
if [[ -f /home/adam/.fzf/shell/key-bindings.zsh ]]; then
  source "/home/adam/.fzf/shell/key-bindings.zsh"
fi
if [[ -f /home/acb29/.fzf/shell/key-bindings.zsh ]]; then
  source "/home/acb29/.fzf/shell/key-bindings.zsh"
fi

