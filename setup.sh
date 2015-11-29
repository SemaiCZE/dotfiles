#!/bin/bash

#install dependencies - for red hat distros
sudo dnf install zsh meld

CONFDIR="${HOME}/dotfiles"
BACKUPDIR="${HOME}/dotfiles_backup"

FILES=".bashrc .profile .vimrc .zshrc .gitconfig .vim"
#.ssh_config need special handling

#prepare backup dir
rm -rf ${BACKUPDIR}
mkdir -p ${BACKUPDIR}

#move existing dotfiles do backup dir and symlink that from dotfiles dir
for FILE in ${FILES}; do
	echo "Backing up ${FILE}"
	mv ${HOME}/${FILE} ${BACKUPDIR}
	echo "Creating symlink"
	ln -s ${CONFDIR}/${FILE} ${HOME}/${FILE}
done

# handle .ssh_config
echo "Backing up .ssh_config"
mv ${HOME}/.ssh/config ${BACKUPDIR}
echo "Creating symlink"
ln -s ${CONFDIR}/.ssh_config ${HOME}/.ssh/config


