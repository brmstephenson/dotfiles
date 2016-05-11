# Setup fzf
# ---------
if [[ ! "$PATH" == */home/acb29/.fzf/bin* ]]; then
  export PATH="$PATH:/home/acb29/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/acb29/.fzf/man* && -d "/home/acb29/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/acb29/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/acb29/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/acb29/.fzf/shell/key-bindings.zsh"

