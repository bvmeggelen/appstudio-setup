#!/bin/sh

echo "Copying binaries to /extbin/bin so we can execute them via scripts"
cp /usr/bin/git /extbin/bin

echo "Creating local dir: bin/"
mkdir -p ~/bin

echo "Adding ~/bin to $PATH"
cat add-local-bin-to-path >> ~/.bashrc

echo "Installing bash-git-prompt..."
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

touch ~/.bashrc
cat install-git-bash-prompt >> ~/.bashrc

echo "Installing default .gitconfig..."
cp .gitconfig ~/.gitconfig

echo ">> BE SURE TO SET user.name AND user.email USING git config --global --edit <<"

echo "Setting default editor to VIM..."
cat set-default-editor-to-vim >> ~/.bashrc

echo "Setting GIT credential helper to cache with a timeout of a day"
git config credential.helper 'cache --timeout 86400'

echo "Adding git-add-modified alias"
cat alias-git-add-modified >> ~/.bashrc

echo "Installing jq..."
curl -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o ~/bin/jq
chmod u+x ~/bin/jq

echo ">> DONE <<"
echo ">> Restart your terminal or run 'source ~/.bashrc' <<"



