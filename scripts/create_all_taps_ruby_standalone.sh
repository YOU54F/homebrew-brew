#!/bin/sh
set -e

tags=$(gh release list --repo https://github.com/pact-foundation/pact-ruby-standalone.git --limit 1000 | cut -f3)

## Last release with x86 Linux May 27, 2022
## https://github.com/pact-foundation/pact-ruby-standalone/releases/tag/v1.88.90
## Broken - Has no pact-1.80.0-linux-x86_64.tar.gz
# https://github.com/pact-foundation/pact-ruby-standalone/releases/tag/v1.80.0
## Releases prior to 1.44 have no checksums
# https://github.com/pact-foundation/pact-ruby-standalone/releases/tag/v1.44.0
# https://github.com/pact-foundation/pact-ruby-standalone/releases/tag/v1.43.1

for tag in ${tags[@]}; do
  version=${tag#v}
  echo creating tap for $version
  if [[ "$version" == '1.88.91-rc2' || "$version" == '1.88.91-rc3' ]]; then
      echo skipping as version broken = $version
  else
     ./scripts/update_tap_version_ruby_standalone.sh $version
  fi     
done