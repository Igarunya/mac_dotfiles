HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

#export QT_QPA_PLATFORMTHEME=qt5ct
#
## Для Qt6
export QT_QPA_PLATFORMTHEME=qt6ct
#
## (опционально) Установить платформу Wayland для Qt
export QT_QPA_PLATFORM=wayland
#
zstyle :compinstall filename '~/.zshrc'
clear && fastfetch
autoload -Uz promptinit
promptinit
export EDITOR=vim
export TERMINAL=foot
export SHELL=/bin/zsh

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

# pacman aliases (if desired, adapt for your favourite AUR helper)
alias pac="sudo /usr/bin/pacman -S"		# default action	- install one or more packages
alias pacu="sudo /usr/bin/pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rns"		# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"		# '[i]nfo'		- show informati'about a package
alias pacq="/usr/bin/pacman -Qi"                # '[s]earch'            - поиск информации об установленном пакете
alias paclo="/usr/bin/pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="sudo /usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="sudo /usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed
alias yayu='yay -Syu'


# Custom
alias zc='vim ~/.zshrc'
alias bsu='source ~/.bashrc'
alias psync='sudo pacman -Syy'
alias paco='sudo pacman -Sc && sudo pacman-optimize'
alias pcf='profile-cleaner f'
alias pcc='profile-cleaner c'
alias pcg='profile-cleaner gc'
alias lcp='sudo localepurge'
alias lcc='sudo /usr/bin/localepurge-config'
alias speed='speedtest-cli'
alias q='exit'
alias md='sudo updatedb'
alias fig='sudo leafpad /etc/pacman.conf'
alias yayu='yay -Syu'
alias gtk='leafpad ~/.gtkrc-2.0'
alias b='btop'
alias r='ranger'
alias yi='yazi'
alias ff='fastfetch'
alias nf='neofetch'
alias w='curl "https://wttr.in/zhytomir?lang=ru"'
alias kc='vim ~/.config/kitty/kitty.conf'
alias hc='vim ~/.config/hypr/hyprland.conf'
alias yt='yt-dlp -f "bv*[height=1080]+ba"'

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Alias

alias calculator='quich'
alias c='quich'
alias calc='quich'
alias ff='clear && fastfetch'
alias uninstall='sudo pacman -R'
alias update='sudo pacman -Syu'
alias fucking='sudo'
alias home='cd ~'
alias ac='audioconverter_translit.sh'

# source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"



export PATH="$HOME/scripts:$PATH"
