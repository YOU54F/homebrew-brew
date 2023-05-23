#!/bin/sh
set -e

tags=$(gh release list --repo https://github.com/pact-foundation/pact-plugins.git --limit 1000 | cut -f3 | grep pact-plugin-cli )
echo $tags
for tag in ${tags[@]}; do
  echo https://github.com/pact-foundation/pact-reference/releases/tag/$tag
  version=${tag#pact-plugin-cli-v}
  echo creating tap for $version
  if [[ "$version" == 'foo-version' ]]; then
      echo skipping as version broken = $version
  else
     ./scripts/update_tap_version_plugin_cli.sh $version
  fi     
done