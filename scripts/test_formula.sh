#!/bin/bash
set -eu

uninstall_tool(){
    brew uninstall $1
}

write_result(){
    echo "| $formula | $version | $1 |\\n" >> TEST_RESULTS.md
}

formula=$1
version=$2
tool=${formula%.rb} # pact-ruby-standalone-1.1.0
brew install Formula/$formula
brew test $tool && uninstall_tool $tool && write_result success || uninstall_tool $tool && write_result fail 
