### RANDOM FISH SETTINGS
set -U fish_greeting
starship init fish | source
colorscript random
fish_default_key_bindings
set TERM "xterm-256color"
zoxide init fish | source

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal blue
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command blue
set fish_color_error '#cc0403'
set fish_color_param blue

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


### MY ALIAS'S
alias ls='exa -al --color=always --group-directories-first'
alias vi='nvim'
alias ccht='curl cht.sh'
alias cht='cht.sh'
alias fm='vifm'
alias ft='flatpak run io.freetubeapp.FreeTube'
alias sudo='doas'

# System Updates
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu'                          # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages


### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "nvim" as manpager
set -x MANPAGER "nvim -c 'set ft=man' -"

# Zoxide SETTINGS

# Initialize hook to add new entries to the database.
if test "$__zoxide_hooked" != 1
    set __zoxide_hooked 1
    function __zoxide_hook --on-variable PWD
        command zoxide add -- (__zoxide_pwd)
    end
end
