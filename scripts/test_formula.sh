#!/bin/bash
set -eu

uninstall_tool(){
    brew uninstall $1
}

write_result(){
    echo "| $formula | $version | $(uname -s) | $(uname -m) | $1 |\\n" >> $2
}

formula=$1
version=$2
TEST_RESULT_FILE=$3
tool=${formula%.rb} # pact-ruby-standalone-1.1.0
brew install Formula/$formula
brew test $tool && uninstall_tool $tool && write_result success $TEST_RESULT_FILE || uninstall_tool $tool && write_result fail $TEST_RESULT_FILE
