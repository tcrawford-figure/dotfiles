#!/usr/bin/env bash

pushd "$HOME" || exit 1

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing..."
  if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    echo "Error: Homebrew installation failed."
    exit 1
  fi
else
  echo "Homebrew is already installed."
fi

(
  echo
  echo "eval $(/opt/homebrew/bin/brew shellenv)"
) >>"$HOME/.zprofile"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Check if Git is installed
if ! command -v git &>/dev/null; then
  echo "Git is not installed. Installing..."

  if ! brew install git; then
    echo "Error: Git installation failed."
    exit 1
  fi
else
  echo "Git is already installed."
fi

# Configure Git if not already configured
if [ -z "$(git config --get user.name)" ]; then
  git config --global user.name "Tyler Crawford"
fi

if [ -z "$(git config --get user.email)" ]; then
  git config --global user.email "tcrawford@figure.com"
fi

echo "Git configuration completed."

# Install chezmoi and 1password-cli via Homebrew
echo "Installing brews."
brew bundle install

chezmoi init --apply https://github.com/tcrawford-figure/dotfiles

echo "Installation completed successfully."
echo "Cleaning up files in home directory..."

rm bootstrap.sh
rm .editorconfig

popd || exit 1
