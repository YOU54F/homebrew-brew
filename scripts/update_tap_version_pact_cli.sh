#!/bin/sh
set -e

homepage="https://github.com/you54f/pact-cli"
version=$1
FORMULAE_FILE="pact.rb"

write_homebrew_formulae() {
    if [ ! -f "$FORMULAE_FILE" ] ; then
        touch "$FORMULAE_FILE"
    else
        : > "$FORMULAE_FILE"
    fi

     exec 3<> $FORMULAE_FILE
        echo "class Pact < Formula" >&3
        echo "  desc \"🔗 Pact in a single binary - Mock/Stub Server, Provider Verifier, Broker Client & Plugin CLI\"" >&3
        echo "  homepage \"https://docs.pact.io\"" >&3
        echo "  license \"MIT\"" >&3
        echo "  version \"$version\"" >&3
        echo "  head \"https://github.com/YOU54F/pact-cli.git\", branch: \"main\"" >&3
        echo "" >&3
        echo "  livecheck do" >&3
        echo "    url :stable" >&3
        echo "    strategy :github_latest" >&3
        echo "  end" >&3
        echo "" >&3
        echo "  depends_on \"rust\" => :build" >&3
        echo "" >&3
        echo "  on_macos do" >&3
        echo "    on_intel do" >&3
        echo "      url \"https://github.com/YOU54F/pact-cli/releases/download/v$version/pact-v$version-x86_64-apple-darwin\"" >&3
        echo "      sha256 \"${sha_macos_x86_64}\"" >&3
        echo "" >&3
        echo "      def install" >&3
        echo "        bin.install \"pact\"" >&3
        echo "      end" >&3
        echo "    end" >&3
        echo "" >&3
        echo "    on_arm do" >&3
        echo "      url \"https://github.com/YOU54F/pact-cli/releases/download/v$version/pact-v$version-aarch64-apple-darwin\"" >&3
        echo "      sha256 \"${sha_macos_arm64}\"" >&3
        echo "" >&3
        echo "      def install" >&3
        echo "        bin.install \"pact\"" >&3
        echo "      end" >&3
        echo "    end" >&3
        echo "  end" >&3
        echo "" >&3
        echo "  on_linux do" >&3
        echo "    on_intel do" >&3
        echo "      url \"https://github.com/YOU54F/pact-cli/releases/download/v$version/pact-v$version-x86_64-unknown-linux-gnu\"" >&3
        echo "      sha256 \"${sha_linux_x86_64}\"" >&3
        echo "" >&3
        echo "      def install" >&3
        echo "        bin.install \"pact\"" >&3
        echo "      end" >&3
        echo "    end" >&3
        echo "" >&3
        echo "    on_arm do" >&3
        echo "      url \"https://github.com/YOU54F/pact-cli/releases/download/v$version/pact-v$version-aarch64-unknown-linux-gnu\"" >&3
        echo "      sha256 \"${sha_linux_arm64}\"" >&3
        echo "" >&3
        echo "      def install" >&3
        echo "        bin.install \"pact\"" >&3
        echo "      end" >&3
        echo "    end" >&3
        echo "  end" >&3
        echo "" >&3
        echo "  def install" >&3
        echo "    # Build from source if no precompiled binary is available" >&3
        echo "    system \"cargo\", \"install\", *std_cargo_args" >&3
        echo "  end" >&3
        echo "" >&3
        echo "  def caveats" >&3
        echo "    <<~EOS" >&3
        echo "      🚀 Pact CLI with Extensions is now installed!" >&3
        echo "" >&3
        echo "      Quick start:" >&3
        echo "        pact --help                           # Show all available commands" >&3
        echo "        pact extension list                   # List available extensions" >&3
        echo "        pact extension install pactflow-ai    # Install PactFlow AI extension" >&3
        echo "        pact pactflow ai --help              # Use PactFlow AI seamlessly" >&3
        echo "" >&3
        echo "      📖 Documentation:" >&3
        echo "        - Extensions: https://github.com/YOU54F/pact-cli/blob/main/EXTENSIONS.md" >&3
        echo "        - Pact Docs: https://docs.pact.io" >&3
        echo "" >&3
        echo "      🔧 Configuration:" >&3
        echo "        Extensions are installed to: ~/.pact/extensions/" >&3
        echo "        Override with: export PACT_CLI_EXTENSIONS_HOME=/custom/path" >&3
        echo "" >&3
        echo "      💡 The Pact CLI includes:" >&3
        echo "        - Mock Server (pact mock)" >&3
        echo "        - Provider Verifier (pact verifier)" >&3
        echo "        - Stub Server (pact stub)" >&3
        echo "        - Broker Client (pact broker)" >&3
        echo "        - PactFlow Client (pact pactflow)" >&3
        echo "        - Plugin CLI (pact plugin)" >&3
        echo "        - Extension System (pact extension)" >&3
        echo "" >&3
        echo "      🔄 Installation options:" >&3
        echo "        - Precompiled binaries (default, fastest)" >&3
        echo "        - From source with Cargo (brew install --build-from-source pact)" >&3
        echo "        - Development version (brew install --HEAD pact)" >&3
        echo "    EOS" >&3
        echo "  end" >&3
        echo "" >&3
        echo "  test do" >&3
        echo "    # Test basic functionality" >&3
        echo "    assert_match \"Pact in a single binary\", shell_output(\"#{bin}/pact --help\")" >&3
        echo "    " >&3
        echo "    # Test version output" >&3
        echo "    version_output = shell_output(\"#{bin}/pact --version\")" >&3
        echo "    assert_match version.to_s, version_output" >&3
        echo "    " >&3
        echo "    # Test extension system" >&3
        echo "    extension_help = shell_output(\"#{bin}/pact extension --help\")" >&3
        echo "    assert_match \"Manage Pact CLI extensions\", extension_help" >&3
        echo "    " >&3
        echo "    # Test subcommand availability and help output" >&3
        echo "    %w[mock verifier stub broker pactflow plugin extension].each do |cmd|" >&3
        echo "      help_output = shell_output(\"#{bin}/pact #{cmd} --help\")" >&3
        echo "      assert_match cmd, help_output.downcase" >&3
        echo "    end" >&3
        echo "  end" >&3
        echo "end" >&3
    exec 3>&-
}

display_help() {
    echo "This script must be run from the root folder."
}

display_usage() {
    echo "\nUsage:\n\"CREATE_PR=true ./scripts/update_tap_version.sh 1.64.1\"\n"
}

if [[ $# -eq 0 ]] ; then
    echo "🚨 Please supply the pact-standalone version to upgrade to"
    display_usage
    exit 1
elif [[ $1 == "--help" ||  $1 == "-h" ]] ; then
    display_help
    display_usage
    exit 1
else

shas=()
for platform in macos linux; do 
    for arch in x86_64 arm64; do 
        filename=pact-${arch}-${platform}
        echo "⬇️  Downloading $filename from $homepage"
        curl -LO $homepage/releases/download/v$version/$filename

        brewshasignature=( $(eval "openssl dgst -sha256 $filename") )
        echo "🔏 Checksum SHA256:\t ${brewshasignature[1]} for ${arch}-${platform}"

        shasignature=( $(eval "openssl dgst -sha1 $filename") )
        echo "🔏 Checksum SHA1:\t ${shasignature[1]} for ${arch}-${platform}"

        echo "⬇️  Downloading $filename.checksum for ${arch}-${platform}"
        curl -LO $homepage/releases/download/v$version/$filename.checksum

        expectedsha=( $(eval "cat $filename.checksum") )
        echo "🔏 Expected SHA1:\t ${expectedsha[0]} for ${arch}-${platform}"

        if [ "${shasignature[1]}" == "${expectedsha[0]}" ]; then
            echo "👮‍♀️ SHA Check: 👍 for ${arch}-${platform}"
        else
            echo "👮‍♀️ SHA Check: 🚨 - checksums do not match! for ${arch}-${platform}"
            # exit 1 # no published shasum to compare against
        fi

        echo "🧹 Cleaning up..."
        rm $filename
        rm $filename.checksum
        echo "🔏 Checksum SHA256:\t ${brewshasignature[1]} for ${arch}-${platform}"
        echo "🧪 Writing formulae..."
        shas+=(${brewshasignature[1]})
    done 
done 

    sha_macos_x86_64=${shas[0]}
    sha_macos_arm64=${shas[1]}
    sha_linux_x86_64=${shas[2]}
    sha_linux_arm64=${shas[3]}
    echo "sha_macos_x86_64:" $sha_macos_x86_64
    echo "sha_macos_arm64:" $sha_macos_arm64
    echo "sha_linux_x86_64:" $sha_linux_x86_64
    echo "sha_linux_arm64:" $sha_linux_arm64

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

        gh pr create --title "chore(release): Update version to v${version}" --fill
        echo "🎉 Done!"
    fi




    exit 0
fi
