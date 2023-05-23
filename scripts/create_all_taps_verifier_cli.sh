#!/bin/sh
set -e

tags=$(gh release list --repo https://github.com/pact-foundation/pact-reference.git --limit 1000 | cut -f3 | grep pact_verifier_cli )
echo $tags
for tag in ${tags[@]}; do
  echo https://github.com/pact-foundation/pact-reference/releases/tag/$tag
  version=${tag#pact_verifier_cli-v}
  echo creating tap for $version
  if [[ "$version" == 'foo-version' ]]; then
      echo skipping as version broken = $version
  else
     ./scripts/update_tap_version_verifier_cli.sh $version
  fi     
done

# https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v0.6.1
# Up to this point only Linux x86_64
# pact_verifier_cli-linux-x86_64-0.6.1.gz

# https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v0.7.0
## MacOS / Windows x86_64 builds added Jun 24, 2020
# pact_verifier_cli-linux-x86_64.gz
# pact_verifier_cli-osx-x86_64.gz
# pact_verifier_cli-windows-x86_64.exe.gz


# # https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v0.9.13
# # No checksums, only x86_64 builds
# # Aug 10, 2022
# pact_verifier_cli-linux-x86_64.gz
# pact_verifier_cli-osx-x86_64.gz
# pact_verifier_cli-windows-x86_64.exe.gz

# # https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v0.9.14
# # Aarch64 Linux build introduced with sha256 checksum

# pact_verifier_cli-linux-aarch64.gz
# pact_verifier_cli-linux-aarch64.gz.sha256
# pact_verifier_cli-linux-x86_64.gz
# pact_verifier_cli-osx-x86_64.gz
# pact_verifier_cli-windows-x86_64.exe.gz

# # https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v0.9.15
# # Aarch64 MacOS build introduced, all files now have sha256 checksums

# pact_verifier_cli-linux-aarch64.gz
# pact_verifier_cli-linux-aarch64.gz.sha256
# pact_verifier_cli-linux-x86_64.gz
# pact_verifier_cli-linux-x86_64.gz.sha256
# pact_verifier_cli-osx-aarch64.gz
# pact_verifier_cli-osx-aarch64.gz.sha256
# pact_verifier_cli-osx-x86_64.gz
# pact_verifier_cli-osx-x86_64.gz.sha256
# pact_verifier_cli-windows-x86_64.exe.gz
# pact_verifier_cli-windows-x86_64.exe.gz.sha256
