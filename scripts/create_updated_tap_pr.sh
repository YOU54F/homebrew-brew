#!/bin/sh
set -e

homepage="https://github.com/you54f/pact-ruby-standalone"
version=$1


display_help() {
    echo "This script must be run from the root folder."
}

display_usage() {
    echo "\nUsage:\n\"./scripts/create_updated_tap_pr.sh 1.64.1\"\n"
}

if [[ $# -eq 0 ]] ; then
    echo "🚨 Please supply the pact-ruby-standalone version to upgrade to"
    display_usage
    exit 1
elif [[ $1 == "--help" ||  $1 == "-h" ]] ; then
    display_help
    display_usage
    exit 1
else


    echo "⚗️  Sorting out the homebrew tap version... "
    git checkout -b version/v$version
    git add .
    git commit -m "chore(release): Update version to v$version"
    git push --set-upstream origin version/v$version

    echo "👏  Go and open that PR now:"
    echo "🔗  $homepage/compare/master...version/v$version"

    hub pull-request --message "chore(release): Update version to v${version}"

    echo "🎉 Done!"

    exit 0
fi
