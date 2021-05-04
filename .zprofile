### Source all dotfiles

for DOTFILE in $(find $HOME/.dotfiles -maxdepth 1 -name ".[^.]*" \
	! \( -name ".zprofile" \
	-o -name ".Rprofile" \
	-o -name ".gitconfig" \
	-o -name ".vimrc" \) \
	-type f)
do
	[ -f "$DOTFILE" ] && source $DOTFILE
done

### Set history size
HISTSIZE=1000000
