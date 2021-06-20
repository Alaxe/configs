#!/bin/sh

cd "$(dirname "$0")"

echo "Copying vimrc"
cp vimrc ~/.vimrc

echo "Installing Pathogen"
rm ~/.vim -rf
cp vim ~/.vim -R
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing plugins"

pluginList=$(cat plugins.txt)

cd ~/.vim/bundle/
for plugin in $pluginList;
do
    echo " -  $plugin"
    git clone $plugin -q
done

echo "Vim has been set up successfully"
