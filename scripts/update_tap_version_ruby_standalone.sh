#!/bin/sh
set -e

homepage="https://github.com/pact-foundation/pact-ruby-standalone"
version=$1
TOOL_NAME=pact-ruby-standalone
TOOL_NAME_PASCAL=PactRubyStandalone
MAJOR_TAG=$(echo $version | cut -d '.' -f 1)
MINOR_TAG=$(echo $version | cut -d '.' -f 2)
PATCH_TAG=$(echo $version | cut -d '.' -f 3)
FORMULA_DIR=Formula
if [[ $LATEST == "true" ]]; then
    FORMULAE_FILE="$FORMULA_DIR/$TOOL_NAME.rb"
    FORMULA_NAME="$TOOL_NAME_PASCAL"
elif [[ $LATEST_VERSION ]]; then
    FORMULAE_FILE="$FORMULA_DIR/${TOOL_NAME}@$MAJOR_TAG.rb"
    FORMULA_NAME="${TOOL_NAME_PASCAL}AT${MAJOR_TAG}"
else
    FORMULAE_FILE="$FORMULA_DIR/$TOOL_NAME-$version.rb"
    FORMULA_NAME="$TOOL_NAME_PASCAL$MAJOR_TAG$MINOR_TAG$PATCH_TAG"
fi

write_homebrew_formulae() {
    if [ ! -f "$FORMULAE_FILE" ] ; then
        touch "$FORMULAE_FILE"
    else
        : > "$FORMULAE_FILE"
    fi
     exec 3<> $FORMULAE_FILE
        echo "class $FORMULA_NAME < Formula" >&3
        echo "  desc \"Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby\"" >&3
        echo "  homepage \"$homepage\"" >&3
        echo "  version \"$version\"" >&3
        echo "" >&3
        echo "  on_macos do" >&3
        if [[ $sha_osx_arm64 && $MAJOR_TAG -gt 1 ]]; then
            echo "    on_arm do" >&3
            echo "      url \"$homepage/releases/download/v$version/pact-$version-osx-arm64.tar.gz\"" >&3
            echo "      sha256 \"${sha_osx_arm64}\"" >&3
            echo "    end" >&3
        elif [[ $MAJOR_TAG -lt 2 ]]; then
            echo "    on_arm do" >&3
            echo "      url \"$homepage/releases/download/v$version/pact-$version-osx.tar.gz\"" >&3
            echo "      sha256 \"${sha_osx_x86_64}\"" >&3
            echo "    end" >&3
        fi
        if [[ $MAJOR_TAG -gt 1 ]]; then
            echo "    on_intel do" >&3
            echo "      url \"$homepage/releases/download/v$version/pact-$version-osx-x86_64.tar.gz\"" >&3
            echo "      sha256 \"${sha_osx_x86_64}\"" >&3
            echo "    end" >&3
        else
            echo "    on_intel do" >&3
            echo "      url \"$homepage/releases/download/v$version/pact-$version-osx.tar.gz\"" >&3
            echo "      sha256 \"${sha_osx_x86_64}\"" >&3
            echo "    end" >&3
        fi
        echo "  end" >&3
        echo "" >&3
        echo "  on_linux do" >&3
        echo "    if Hardware::CPU.is_64_bit?" >&3
        if [[ $sha_linux_arm64 && $MAJOR_TAG -gt 1 ]]; then
            echo "      on_arm && Hardware::CPU.is_64_bit? do" >&3
            echo "        url \"$homepage/releases/download/v$version/pact-$version-linux-arm64.tar.gz\"" >&3
            echo "        sha256 \"${sha_linux_arm64}\"" >&3
            echo "      end" >&3
        fi
            echo "      on_intel do" >&3
            echo "        url \"$homepage/releases/download/v$version/pact-$version-linux-x86_64.tar.gz\"" >&3
            echo "        sha256 \"${sha_linux_x86_64}\"" >&3
            echo "      end" >&3
            echo "    end" >&3
        if [[ $sha_linux_x86 ]]; then
            echo "   if Hardware::CPU.is_32_bit?" >&3
            echo "      on_intel do" >&3
            echo "        url \"$homepage/releases/download/v$version/pact-$version-linux-x86.tar.gz\"" >&3
            echo "        sha256 \"${sha_linux_x86}\"" >&3
            echo "      end" >&3
            echo "    end" >&3
        fi
        echo "  end" >&3
        echo "" >&3
        echo "  def install" >&3
        echo "    # pact-ruby-standalone" >&3
        echo "    bin.install Dir[\"bin/*\"]" >&3
        echo "    lib.install Dir[\"lib/*\"]" >&3
        echo "    puts \"# (see $homepage/releases/)'\"" >&3
        echo "    puts \"# Run 'pact --help'\"" >&3
        echo "    puts \"# Run 'pact-broker --help'\"" >&3
        echo "    puts \"# Run 'pact-message --help'\"" >&3
        echo "    puts \"# Run 'pact-mock-service --help'\"" >&3
        echo "    puts \"# Run 'plugin-cli --help'\"" >&3
        echo "    puts \"# Run 'pact-provider-verifier --help'\"" >&3
        echo "    puts \"# Run 'pact-stub-service --help'\"" >&3
        echo "    puts \"# Run 'pactflow --help'\"" >&3
        if [[ -z $sha_osx_arm64 && $MAJOR_TAG -lt 1 ]]; then 
            echo "    on_macos do" >&3
            echo "      on_arm do" >&3
            echo "        puts \"# Rosetta is required to run $TOOL_NAME commands\"" >&3
            echo "        puts \"# sudo softwareupdate --install-rosetta --agree-to-license\"" >&3
            echo "      end" >&3
            echo "    end" >&3      
        fi
        echo "  end" >&3
        echo "" >&3
        echo "  test do" >&3
        echo "    system \"#{bin}/pact\", \"--help\"" >&3
        echo "    system \"#{bin}/pact-broker\", \"--help\"" >&3
        echo "    system \"#{bin}/pact-message\", \"--help\"" >&3
        echo "    system \"#{bin}/pact-mock-service\", \"--help\"" >&3
        echo "    system \"#{bin}/pact-plugin-cli\", \"--help\"" >&3
        echo "    system \"#{bin}/pact-provider-verifier\", \"--help\"" >&3
        echo "    system \"#{bin}/pact-stub-service\", \"--help\"" >&3
        echo "    system \"#{bin}/pactflow\", \"--help\"" >&3
        echo "" >&3
        echo "  end" >&3
        echo "end" >&3
    exec 3>&-
}

display_help() {
    echo "This script must be run from the root folder."
}

display_usage() {
    echo "\nCreate a versionsed formula of $TOOL_NAME\"\n"
    echo "\nUsage:\n\"./scripts/update_tap_version_ruby_standalone.sh 1.64.1\"\n"
    echo "\nCreate a pull request at end on run\"\n"
    echo "\nUsage:\n\"CREATE_PR=true ./scripts/update_tap_version_ruby_standalone.sh 1.64.1\"\n"
    echo "\nCreate as latest version\"\n"
    echo "\nUsage:\n\"LATEST=true ./scripts/update_tap_version_ruby_standalone.sh 1.64.1\"\n"
}

if [[ $# -eq 0 ]] ; then
    echo "🚨 Please supply the $TOOL_NAME version to upgrade to"
    display_usage
    exit 1
elif [[ $1 == "--help" ||  $1 == "-h" ]] ; then
    display_help
    display_usage
    exit 1
else

if [[ $MAJOR_TAG -lt 2 && ($MINOR_TAG -lt 89 && $PATCH_TAG -lt 91) ]]; then
    archs=(x86_64 x86)
elif [[ $MAJOR_TAG -lt 2 ]]; then
    archs=(x86_64)
else
    archs=(x86_64 arm64)
fi

shas=()
for platform in osx linux; do 
    for arch in ${archs[@]}; do 
        echo "generating for $platform + $arch"
        if [[ ${platform} == "osx" && ${arch} == "x86" ]]; then
            echo "no binary for $platform + $arch"
            break
        elif [[ ${platform} == "linux" && ${arch} == "x86_64" && $MAJOR_TAG -eq 1 && $MINOR_TAG -eq 80 && $PATCH_TAG -eq 0 ]]; then
            echo "no binary for $platform + $arch"
            break
        elif [[ ${platform} == "osx" && $MAJOR_TAG -lt 2 ]]; then
            echo "setting osx filename $platform + $arch"
            filename=pact-$version-${platform}
        else
            filename=pact-$version-${platform}-${arch}
        fi

        echo "⬇️  Downloading $filename.tar.gz from $homepage/releases/tag/v$version"
        curl -LO $homepage/releases/download/v$version/$filename.tar.gz

        brewshasignature=( $(eval "openssl dgst -sha256 $filename.tar.gz") )
        echo "🔏 Checksum SHA256:\t ${brewshasignature[1]} for ${arch}"

        shasignature=( $(eval "openssl dgst -sha1 $filename.tar.gz") )
        echo "🔏 Checksum SHA1:\t ${shasignature[1]} for ${platform}-${arch}"

        if [[ $MAJOR_TAG -lt 2 && $MINOR_TAG -lt 44  ]]; then
            echo "🧹 Skipping SHA check 🚨 - as they don't exist for $version"
            echo "🔏 Checksum SHA256:\t ${brewshasignature[1]} for ${platform}-${arch}"
            echo "🧪 Writing formulae..."
            shas+=(${brewshasignature[1]})
            echo "🧹 Cleaning up..."
            rm $filename.tar.gz
        else
            echo "⬇️  Downloading $filename.tar.gz.checksum for ${platform}-${arch}"
            curl -LO $homepage/releases/download/v$version/$filename.tar.gz.checksum

            expectedsha=( $(eval "cat $filename.tar.gz.checksum") )
            echo "🔏 Expected SHA1:\t ${expectedsha[0]} for ${platform}-${arch}"

            if [ "${shasignature[1]}" == "${expectedsha[0]}" ]; then
                echo "👮‍♀️ SHA Check: 👍 for ${platform}-${arch}"
            else
                echo "👮‍♀️ SHA Check: 🚨 - checksums do not match! for ${platform}-${arch}"
                exit 1
            fi

            echo "🧹 Cleaning up..."
            rm $filename.tar.gz
            rm $filename.tar.gz.checksum

            echo "🔏 Checksum SHA256:\t ${brewshasignature[1]} for ${platform}-${arch}"
            echo "🧪 Writing formulae..."
            shas+=(${brewshasignature[1]})
        fi

    done 
done 

if [[ $MAJOR_TAG -lt 2 && ($MINOR_TAG -lt 89 && $PATCH_TAG -lt 91) ]]; then
    sha_osx_x86_64=${shas[0]}
    sha_linux_x86_64=${shas[1]}
    sha_linux_x86=${shas[2]}
elif [[ $MAJOR_TAG -lt 2 ]]; then
    sha_osx_x86_64=${shas[0]}
    sha_linux_x86_64=${shas[1]}
else
    sha_osx_x86_64=${shas[0]}
    sha_osx_arm64=${shas[1]}
    sha_linux_x86_64=${shas[2]}
    sha_linux_arm64=${shas[3]}
fi

    echo "sha_osx_arm64:" $sha_osx_arm64
    echo "sha_linux_x86:" $sha_linux_x86
    echo "sha_osx_x86_64:" $sha_osx_x86_64
    echo "sha_linux_arm64:" $sha_linux_arm64
    echo "sha_linux_x86_64:" $sha_linux_x86_64

    write_homebrew_formulae

    if [[ ! -n "${CREATE_PR}" ]] 
    then
        echo "🎉 Done!"
    else
        git checkout -b version/v$version
        git add $FORMULAE_FILE
        git commit -m "chore(release): Update version to v$version"
        git push --set-upstream origin version/v$version

        echo "👏  Go and open that PR now:"
        echo "🔗  $homepage/compare/master...version/v$version"

        hub pull-request --message "chore(release): Update version to v${version}"
        echo "🎉 Done!"
    fi


    exit 0
fi