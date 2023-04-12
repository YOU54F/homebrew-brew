FROM ubuntu:22.04

RUN apt-get update --yes && apt-get install --yes build-essential libz-dev libreadline-dev git curl
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
 eval "$(~/.rbenv/bin/rbenv init - bash)"
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
git -C "$(rbenv root)"/plugins/ruby-build pull
rbenv install --list-all
rbenv install 2.6.8
rbenv global 2.6.8
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
brew doctor
chmod -R go-w "$(brew --prefix)/share/zsh"