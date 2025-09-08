if status is-interactive
    atuin init fish | source
    eval "$(devbox global shellenv)"
end

# Disable fish greeting
set -g fish_greeting

# XDG - Base Directory Specification
set -gx XDG_CONFIG_HOME "$HOME/.local/dotfiles"
set -gx XDG_BIN_HOME "$HOME/.local/bin"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.local/cache"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# Configuration Environment Variable
set -gx GIT_CONFIG_GLOBAL "$XDG_CONFIG_HOME/git/.gitconfig"
set -gx EDITOR "micro"
set -gx BROWSER "vivaldi"

# Cache Environment Variable
set -gx UV_PYTHON_INSTALL_DIR "$HOME/.local/py"
set -gx UV_CACHE_DIR "$XDG_CACHE_HOME/uv"
set -gx UV_TOOL_DIR "$XDG_DATA_HOME/uv/tools"
set -gx UV_TOOL_BIN_DIR "$XDG_BIN_HOME"
set -gx BUN_INSTALL "$HOME/.local"
set -gx BUN_INSTALL_DIR_CACHE "$HOME/.local/cache"

# History Environment Variable
set -gx HISTORY_DIR "$HOME/.local/history"
set -gx NODE_REPL_HISTORY "$HISTORY_DIR/history_node"
set -gx LESSHISTFILE "$HISTORY_DIR/history_less"
set -gx PYTHON_HISTORY "$HISTORY_DIR/history_python"
set -gx _ZO_DATA_DIR "$HISTORY_DIR/zoxide"
set -gx HISTFILE "$HISTORY_DIR/bash_history"

# Binary Directory Variable
set -gx NIMBLE_BIN "$HOME/.nimble/bin"
set -gx CARGO_BIN "$HOME/.cargo/bin"
set -gx ZIG_BIN "$HOME/.zig"
set -gx VCPKG_ROOT "$HOME/.vcpkg"

# Add directory to PATH
fish_add_path "$XDG_BIN_HOME"
fish_add_path "$NIMBLE_BIN"
fish_add_path "$CARGO_BIN"
fish_add_path "$ZIG_BIN"

# # Function to generate custom fish prompt
# function fish_prompt
#     # Colors
#     set -l BOLD (set_color -o)
#     set -l BLUE (set_color blue)
#     set -l RED (set_color -o red)
#     set -l RESET (set_color normal)
# 
#     set -l user_host
#     if set -q CONTAINER_ID
#         set user_host "box:$CONTAINER_ID"
#     else
#         set user_host "$hostname"
#     end
#     set -l user_name (whoami)
#     set -l working_dir " "(pwd)
# 
#     echo -n "$BOLD$user_name@$user_host$RESET:$working_dir > "
# end

# Aliases
alias .. "cd .."
if type -q eza
    alias ls "eza"
    alias la "eza -la"
    alias l "eza -l"
else
    alias la "ls -la"
    alias l "ls -l"
end
alias rr "rm -r"
alias cd "z"


if type -q sudo-rs
    alias sudo sudo-rs
end

if type -q zoxide
    zoxide init fish | source
end

# bun
set -gx BUN_INSTALL "$HOME/.local/share/reflex/bun"
set -gx fish_user_paths "$BUN_INSTALL/bin" $fish_user_paths
# >>> xmake >>>
if test -f "/home/reanom/.xmake/profile"
    source "/home/reanom/.xmake/profile"
end
# <<< xmake <<<
