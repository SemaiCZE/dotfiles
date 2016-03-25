#!/bin/bash

#install dependencies - for red hat distros
sudo dnf install zsh meld vim-command-t vim-nerdtree vim-javabrowser vim-X11 vim-omnicppcomplete

CONFDIR="${HOME}/dotfiles"
BACKUPDIR="${HOME}/dotfiles_backup"

FILES=".bashrc .profile .vimrc .zshrc .gitconfig .vim .tmux.conf"
#.ssh_config need special handling

#prepare backup dir
rm -rf ${BACKUPDIR}
mkdir -p ${BACKUPDIR}

#move existing dotfiles do backup dir and symlink that from dotfiles dir
for FILE in ${FILES}; do
	echo "Backing up ${FILE}"
	if test -h ${HOME}/${FILE}; then
		mv `readlink ${HOME}/${FILE}` ${BACKUPDIR}
	else
		mv ${HOME}/${FILE} ${BACKUPDIR}
	fi
	echo "Creating symlink"
	ln -s ${CONFDIR}/${FILE} ${HOME}/${FILE}
done

# handle .ssh_config
echo "Backing up .ssh_config"
if test -h ${HOME}/.ssh/config; then
	mv `readlink ${HOME}/.ssh/config` ${BACKUPDIR}
else
	mv ${HOME}/.ssh/config ${BACKUPDIR}
fi
echo "Creating symlink"
ln -s ${CONFDIR}/.ssh_config ${HOME}/.ssh/config


