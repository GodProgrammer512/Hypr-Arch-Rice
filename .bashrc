#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command aliases:
alias dir='ls --color=auto -la'
alias lsblk='lsblk -p'
alias grep='grep --color=auto'
alias m='touch'
alias md='mkdir -p'
alias r='rm -f'
alias rd='rm -fr'
alias cp='cp -r'
alias clear='printf \\033[2J\\033[3J\\033[H'
alias clean='sudo rm -fr /tmp/*'
alias diskspace='duf /'
alias disk='ncdu /'
alias find='sudo find / -name'
alias shred='shred -funz 5'
alias pacman='pacman --needed'
alias edit='nvim'
export EDITOR="nvim"
export VISUAL="nvim"
export FILE_MANAGER="yazi"
export GPG_TTY=$(tty)

# Git Status Function:
git_status()
{
	git rev-parse --is-inside-work-tree &>/dev/null || return

	local branch=$(git branch --show-current 2>/dev/null)
	[ -z "$branch" ] && return

	local out=" ${branch} "
	local status=$(git status --porcelain=v2 --branch 2>/dev/null)
	local dirty=0

	if echo "$status" | grep -q '^1 .D'; then
		out="${out}✘"
		dirty=1
	fi

	if echo "$status" | grep -q '^1 .M'; then
		out="${out}!"
		dirty=1
	fi

	if echo "$status" | grep -q '^1 [^.]'; then
		out="${out}+"
		dirty=1
	fi

	if echo "$status" | grep -q '^? '; then
		out="${out}?"
		dirty=1
	fi

	local ahead=$(echo "$status" | grep '^# branch.ab' | awk '{print $3}' | sed 's/^+//')
	local behind=$(echo "$status" | grep '^# branch.ab' | awk '{print $4}' | sed 's/^-//')

	if [[ -n "$ahead" && "$ahead" -gt 0 ]]; then
		out="${out}⇡"
		dirty=1
	fi

	if [[ -n "$behind" && "$behind" -gt 0 ]]; then
		out="${out}⇣"
		dirty=1
	fi

	if [ "$dirty" -eq 0 ]; then
		out=" ${branch}"
	fi

	echo -e "─{\\033[33m$out\\033[m\\033[32m}"
}

# Clear terminal after opening it:
clear

# Terminals:
PS1='\n\033[32m┌──(\033[34m\u@\h\033[32m)─[\033[m\033[1m\w\033[m\033[32m]$(git_status)─\033[36m $(date +"%H:%M:%S")\033[m\033[32m\n\033[32m└─\033[34m$\033[m ' # Kali type.
# PS1='\n' # Minimalist 1 type 1.
# PS1='\n> ' # Minimalist 2 type 1.
# PS1='\n\033[34m>\033[m ' # Minimalist 2 type 2.
# PS1='\n\033[31m>\033[m ' # Minimalist 2 type 3.
# PS1='\n\033[32m>\033[m ' # Minimalist 2 type 4.
# PS1='\n$ ' # Minimalist 3 type 1.
# PS1='\n\033[34m$\033[m ' # Minimalist 3 type 2.
# PS1='\n\033[31m$\033[m ' # Minimalist 3 type 3.
# PS1='\n\033[32m$\033[m ' # Minimalist 3 type 4.
# PS1='\n[\u@\h \W]$ ' # Arch Linux normal terminal config.
# PS1='\n\033[32m\u@\h\033[m:\033[34m\w\033[m$ ' # Ubuntu type.

# Auto install Tree when starts terminal:
if [ -f /usr/bin/tree ]; then
	echo Tree installed...
else
	echo Tree is not installed, starting install...
	sudo pacman -S tree
	clear
fi

# Auto install Less when starts terminal:
if [ -f /usr/bin/less ]; then
	echo Less installed...
else
	echo Less is not installed, starting install...
	sudo pacman -S less
	clear
fi

# Auto install Man when starts terminal:
if [ -f /usr/bin/man ]; then
	echo Man installed...
else
	echo Man is not installed, starting install...
	sudo pacman -S man
	clear
fi

# Auto install or start starship when starts terminal:
if [ -f /usr/bin/starship ]; then
	echo Starship installed...
else
	echo Starship is not installed, starting install...
	sudo pacman -S starship
	clear
fi

# Auto install DUF when starts terminal:
if [ -f /usr/bin/duf ]; then
	echo DUF installed...
else
	echo DUF is not installed, starting install...
	sudo pacman -S duf
	clear
fi

# Auto install NCDU when starts terminal:
if [ -f /usr/bin/ncdu ]; then
	echo NCDU installed...
else
	echo NCDU is not installed, starting install...
	sudo pacman -S ncdu
	clear
fi

# Auto install XDG User Dirs when starts terminal:
if [ -f /usr/bin/xdg-user-dirs-update ]; then
	echo XDG User Dirs installed...
else
	echo XDG User Dirs is not installed, starting install...
	sudo pacman -S xdg-user-dirs
	clear
fi

# Auto install Fast Fetch when starts terminal:
if [ -f /usr/bin/fastfetch ]; then
	echo Fast Fetch installed...
else
	echo Fastfetch is not installed, starting install...
	sudo pacman -S fastfetch
	clear
fi

# Auto install GNU PG when starts terminal:
if [ -f /usr/bin/gpg ]; then
	echo GNU PG installed...
else
	echo GNU PG is not installed, starting install...
	sudo pacman -S gnupg
	clear
fi

# Auto install AGE when starts terminal:
if [ -f /usr/bin/age ]; then
	echo AGE installed...
else
	echo AGE is not installed, starting install...
	sudo pacman -S age
	clear
fi

# Auto install Open SSH when starts terminal:
if [ -f /usr/bin/ssh ]; then
	echo Open SSH installed...
else
	echo Open SSH is not installed, starting install...
	sudo pacman -S openssh
	clear
fi

# Auto install SL when starts terminal:
if [ -f /usr/bin/sl ]; then
	echo SL installed...
else
	echo SL is not installed, starting install...
	sudo pacman -S sl
	clear
fi

# Auto install Yet Another Yourgut when starts terminal:
if [ -f /usr/bin/yay ]; then
	echo YAY installed...
else
	echo Yet Another Yourgut is not installed, starting install...
	sudo pacman -S --needed base-devel git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -fr ./yay
	clear
fi

# Auto install Ascii when starts terminal:
if [ -f /usr/bin/ascii ]; then
	echo Ascii installed...
else
	echo Ascii is not installed, starting install...
	sudo pacman -S ascii
	clear
fi

# Auto install Figlet when starts terminal:
if [ -f /usr/bin/figlet ]; then
	echo Figlet installed...
else
	echo Figlet is not installed, starting install...
	sudo pacman -S figlet
	clear
fi

# Auto install Cow Say when starts terminal:
if [ -f /usr/bin/cowsay ]; then
	echo Cow Say installed...
else
	echo Cow Say is not installed, starting install...
	sudo pacman -S cowsay
	clear
fi

# Auto install Toilet when starts terminal:
if [ -f /usr/bin/toilet ]; then
	echo Toilet installed...
else
	echo Toilet is not installed, starting install...
	sudo pacman -S toilet
	clear
fi

# Auto install CMatrix when starts terminal:
if [ -f /usr/bin/cmatrix ]; then
	echo CMatrix installed...
else
	echo CMatrix is not installed, starting install...
	sudo pacman -S cmatrix
	clear
fi

# Auto install AsciiQuarium when starts terminal:
if [ -f /usr/bin/asciiquarium ]; then
	echo Asciiquarium installed...
else
	echo Asciiquarium is not installed, starting install...
	sudo pacman -S asciiquarium
	clear
fi

# Auto install N Snake when starts terminal:
if [ -f /usr/bin/nsnake ]; then
	echo N Snake installed...
else
	echo N Snake is not installed, starting install...
	yay -S nsnake
	clear
fi

# Auto install Vi Tetris when starts terminal:
if [ -f /usr/bin/vitetris ]; then
	echo Vi Tetris installed...
else
	echo Vi Tetris is not installed, starting install...
	yay -S vitetris
	clear
fi

# Auto install Bastet when starts terminal:
if [ -f /usr/bin/bastet ]; then
	echo Bastet installed...
else
	echo Bastet is not installed, starting install...
	yay -S bastet
	clear
fi

# Auto install GNU Chess when starts terminal:
if [ -f /usr/bin/gnuchess ]; then
	echo GNU Chess installed...
else
	echo GNU Chess is not installed, starting install...
	sudo pacman -S gnuchess
	clear
fi

# Auto install Git when starts terminal:
if [ -f /usr/bin/git ]; then
	echo Git installed...
else
	echo Git is not installed, starting install...
	sudo pacman -S git
	clear
fi

# Auto install Github CLI when starts terminal:
if [ -f /usr/bin/gh ]; then
	echo Github CLI installed...
else
	echo Github CLI is not installed, starting install...
	sudo pacman -S github-cli
	clear
fi

# Auto install flatpak when starts terminal:
if [ -f /usr/bin/flatpak ]; then
	echo Flatpak installed...
else
	echo Flatpak is not installed, starting install...
	sudo pacman -S flatpak
	clear
fi

# Auto install Top when starts terminal:
if [ -f /usr/bin/top ]; then
	echo Top installed...
else
	echo Top is not installed, starting install...
	sudo pacman -S top
	clear
fi

# Auto install H Top when starts terminal:
if [ -f /usr/bin/htop ]; then
	echo H Top installed...
else
	echo H Top is not installed, starting install...
	sudo pacman -S htop
	clear
fi

# Auto install B Top when starts terminal:
if [ -f /usr/bin/btop ]; then
	echo B Top installed...
else
	echo B Top is not installed, starting install...
	sudo pacman -S btop
	clear
fi

# Auto install Neovim when starts terminal:
if [ -f /usr/bin/nvim ]; then
	echo Neovim installed...
else
	echo Neovim is not installed, starting install...
	sudo pacman -S neovim
	clear
fi

# Auto install Yazi when starts terminal:
if [ -f /usr/bin/yazi ]; then
	echo Yazi installed...
else
	echo Yazi is not installed, starting install...
	sudo pacman -S yazi
	clear
fi

# Clear terminal after verifications and fast fetch:
clear
fastfetch
