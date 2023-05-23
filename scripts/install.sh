#!/bin/sh
set -e

if [[ $CI == 'true' && -n $CIRRUS_CLI ]]; then
    brew tap you54f/pact-ruby
    cd $(brew --prefix)/Library/Taps/you54f/homebrew-pact/
    git checkout $GITHUB_SHA
    brew install --verbose --debug pact-ruby-standalone
else
    brew install --verbose --debug pact-ruby-standalone.rb
fi