#!/bin/sh
set -e

tags=$(gh release list --repo https://github.com/pact-foundation/pact-reference.git --limit 1000 | cut -f3 | grep libpact_ffi )
echo $tags

for tag in ${tags[@]}; do
  echo https://github.com/pact-foundation/pact-reference/releases/tag/$tag
  version=${tag#libpact_ffi-v}
  echo creating tap for $version
  if [[ "$version" == '0.3.17' ]]; then
      echo skipping as version broken = $version
  else
      echo $version
     ./scripts/update_tap_version_libpact_ffi.sh $version
  fi     
done

# https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.0.0
# Pact FFI Library 0.0.0
# libpact_ffi-linux-x86_64.so.gz
# libpact_ffi-osx-x86_64.dylib.gz
# pact.h
# pact_ffi-windows-x86_64.dll.gz
# pact_ffi-windows-x86_64.dll.gz.sha256
# pact_ffi-windows-x86_64.dll.lib.gz
# pact_ffi-windows-x86_64.dll.lib.gz.sha256
# pact_ffi-windows-x86_64.lib.gz
# pact_ffi-windows-x86_64.lib.gz.sha256

# https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.0.1
# libpact_ffi-osx-aarch64-apple-darwin.dylib.gz


# https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.2.3
# musl release added
# libpact_ffi-linux-x86_64-musl.a.gz
# although just .a file

# https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.3.6
# aarch64 build created for linux
# libpact_ffi-linux-aarch64.so.gz
# 