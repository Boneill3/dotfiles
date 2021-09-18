#!/bin/bash

echo "Installing required packages..."
which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update --verbose 
brew upgrade --verbose
brew bundle install --file $HOME/dotfiles/darwin/Brewfile

if [[ -z "${ZSH}" ]]; then
  echo "Installing oh my zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
else
  echo "oh my zsh detected..."
fi

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# Set Terminal font
echo "Updating terminal font..."

osascript -e "tell application \"Terminal\"
    set ProfilesNames to name of every settings set
    repeat with ProfileName in ProfilesNames
        set font name of settings set ProfileName to \"Hack Nerd Font\"
        set font size of settings set ProfileName to 14
    end repeat
end tell"

echo "Complete"
