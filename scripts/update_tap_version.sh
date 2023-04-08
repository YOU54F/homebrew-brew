#!/bin/sh
set -e

homepage="https://github.com/you54f/pact-ruby-standalone"
version=$1
FORMULAE_FILE="pact-ruby-standalone.rb"

write_homebrew_formulae() {
    if [ ! -f "$FORMULAE_FILE" ] ; then
        touch "$FORMULAE_FILE"
    else
        : > "$FORMULAE_FILE"
    fi

     exec 3<> $FORMULAE_FILE
        echo "class PactRubyStandalone < Formula" >&3
        echo "  desc \"Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby\"" >&3
        echo "  homepage \"$homepage\"" >&3
        echo "  " >&3
        echo "  on_macos do" >&3
        echo "    on_arm do" >&3
        echo "      url \"$homepage/releases/download/v$version/pact-$version-osx-arm64.tar.gz\"" >&3
        echo "      sha256 \"${sha_osx_arm64}\"" >&3
        echo "    end" >&3
        echo "    on_intel do" >&3
        echo "      url \"$homepage/releases/download/v$version/pact-$version-osx-x86_64.tar.gz\"" >&3
        echo "      sha256 \"${sha_osx_x86_64}\"" >&3
        echo "    end" >&3
        echo "  end" >&3
        echo "  " >&3
        echo "  on_linux do" >&3
        echo "    on_arm do" >&3
        echo "      url \"$homepage/releases/download/v$version/pact-$version-linux-arm64.tar.gz\"" >&3
        echo "      sha256 \"${sha_linux_arm64}\"" >&3
        echo "    end" >&3
        echo "    on_intel do" >&3
        echo "      url \"$homepage/releases/download/v$version/pact-$version-linux-x86_64.tar.gz\"" >&3
        echo "      sha256 \"${sha_linux_x86_64}\"" >&3
        echo "    end" >&3
        echo "  end" >&3
        echo "" >&3
        echo "  def install" >&3
        echo "    bin.install Dir[\"bin/*\"]" >&3
        echo "    lib.install Dir[\"lib/*\"]" >&3
        echo "" >&3
        echo "    puts \"# Run 'pact-mock-service --help' (see $homepage/releases/)\"" >&3
        echo "  end" >&3
        echo "" >&3
        echo "  test do" >&3
        echo "    system \"#{bin}/pact-mock-service\", \"help\"" >&3
        echo "  end" >&3
        echo "end" >&3
    exec 3>&-
}

display_help() {
    echo "This script must be run from the root folder."
}

display_usage() {
    echo "\nUsage:\n\"./scripts/update_tap_version.sh 1.64.1\"\n"
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

shas=()
for platform in osx linux; do 
    for arch in arm64 x86_64; do 
        echo "⬇️  Downloading pact-$version-${platform}-${arch}.tar.gz from $homepage"
        curl -LO $homepage/releases/download/v$version/pact-$version-${platform}-${arch}.tar.gz

        brewshasignature=( $(eval "openssl dgst -sha256 pact-$version-${platform}-${arch}.tar.gz") )
        echo "🔏 Checksum SHA256:\t ${brewshasignature[1]} for ${arch}"

        shasignature=( $(eval "openssl dgst -sha1 pact-$version-${platform}-${arch}.tar.gz") )
        echo "🔏 Checksum SHA1:\t ${shasignature[1]} for ${platform}-${arch}"

        echo "⬇️  Downloading pact-$version-${platform}-${arch}.tar.gz.checksum for ${platform}-${arch}"
        curl -LO $homepage/releases/download/v$version/pact-$version-${platform}-${arch}.tar.gz.checksum

        expectedsha=( $(eval "cat pact-$version-${platform}-${arch}.tar.gz.checksum") )
        echo "🔏 Expected SHA1:\t ${expectedsha[0]} for ${platform}-${arch}"

        if [ "${shasignature[1]}" == "${expectedsha[0]}" ]; then
            echo "👮‍♀️ SHA Check: 👍 for ${arch}"
        else
            echo "👮‍♀️ SHA Check: 🚨 - checksums do not match! for ${arch}"
            # exit 1
        fi

        echo "🧹 Cleaning up..."
        rm pact-$1-${platform}-${arch}.tar.gz
        rm pact-$1-${platform}-${arch}.tar.gz.checksum
        echo "🔏 Checksum SHA256:\t ${brewshasignature[1]} for ${platform}-${arch}"
        echo "🧪 Writing formulae..."
        shas+=(${brewshasignature[1]})
    done 
done 

    sha_osx_arm64=${shas[0]}
    sha_osx_x86_64=${shas[1]}
    sha_linux_arm64=${shas[2]}
    sha_linux_x86_64=${shas[3]}
    echo "sha_osx_arm64:" $sha_osx_arm64
    echo "sha_osx_x86_64:" $sha_osx_x86_64
    echo "sha_linux_arm64:" $sha_linux_arm64
    echo "sha_linux_x86_64:" $sha_linux_x86_64

    write_homebrew_formulae

    echo "⚗️  Sorting out the homebrew tap version... "
    git checkout -b version/v$version
    git add $FORMULAE_FILE
    git commit -m "chore(release): Update version to v$version"
    git push --set-upstream origin version/v$version

    echo "👏  Go and open that PR now:"
    echo "🔗  $homepage/compare/master...version/v$version"

    hub pull-request --message "chore(release): Update version to v${version}"

    echo "🎉 Done!"

    exit 0
fi
