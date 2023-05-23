#!/bin/bash
set -u

uninstall_tool(){
    brew uninstall $1
}

write_result(){
    echo "| $formula | $version | $(uname -s) | $(uname -m) | $1 |" >> $2
}

formula=$1
version=$2
TEST_RESULT_FILE=$3
tool=${formula%.rb} # pact-ruby-standalone-1.1.0
installed=false
brew install Formula/$formula && installed=true || write_result 🕵️ $TEST_RESULT_FILE


if brew install Formula/$formula; then
    if  brew test $tool; then
    write_result ✅ $TEST_RESULT_FILE && uninstall_tool $tool
    else 
    write_result ❌ $TEST_RESULT_FILE  && uninstall_tool $tool
else 
    write_result 🕵️ $TEST_RESULT_FILE
fi

## Legend
# 🕵️ - Failed to Install
# ❌ - Tests Failed
# ✅ - Tests Passed