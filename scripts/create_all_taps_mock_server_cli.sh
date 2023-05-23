#!/bin/sh
set -e


tags=$(gh release list --repo https://github.com/pact-foundation/pact-reference.git --limit 1000 | cut -f3 | grep mock_server_cli )
echo $tags
for tag in ${tags[@]}; do
  echo https://github.com/pact-foundation/pact-reference/releases/tag/$tag
  version=${tag#pact_mock_server_cli-v}
  echo creating tap for $version
  if [[ "$version" == 'foo-version' ]]; then
      echo skipping as version broken = $version
  else
     ./scripts/update_tap_version_mock_server_cli.sh $version
  fi     
done

# https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v0.6.0
# pact_mock_server_cli
# All builds prior have the version number appended


# https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v0.6.1
# May 27, 2020  MacOS & Windows builds added
# pact_mock_server_cli-linux-x86_64.gz
# pact_mock_server_cli-osx-x86_64.gz
# pact_mock_server_cli-windows-x86_64.exe.gz


## https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v0.7.4
## Checksums added except for windows
# pact_mock_server_cli-linux-x86_64.gz.sha256
# pact_mock_server_cli-osx-x86_64.gz.sha256

## https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v0.7.5
## Checksums added for windows

# # https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v0.7.7
# # x86_64 builds only Jan 25, 2022
# pact_mock_server_cli-linux-x86_64.gz
# pact_mock_server_cli-linux-x86_64.gz.sha256
# pact_mock_server_cli-osx-x86_64.gz
# pact_mock_server_cli-osx-x86_64.gz.sha256
# pact_mock_server_cli-windows-x86_64.exe.gz
# pact_mock_server_cli-windows-x86_64.exe.gz.sha256

# # https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v0.7.8
# # linux aarch64 build introduced Aug 16, 2022
# pact_mock_server_cli-linux-aarch64.gz
# pact_mock_server_cli-linux-aarch64.gz.sha256
