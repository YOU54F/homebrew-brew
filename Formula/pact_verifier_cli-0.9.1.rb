class PactVerifierCli091 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.1/pact_verifier_cli-osx-x86_64.gz"
      sha256 "5ace965f41ee885c879c3d275ca17224aabae410d43a931331793cbe0083ec8c"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.1/pact_verifier_cli-osx-x86_64.gz"
      sha256 "5ace965f41ee885c879c3d275ca17224aabae410d43a931331793cbe0083ec8c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.1/pact_verifier_cli-linux-x86_64.gz"
      sha256 "9f774641f66e6733a3ba7af5c56aae7fda847166e57b7932e5d967783140bc7c"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact_verifier_cli --help'"
    on_macos do
      on_arm do
        puts "# Rosetta is required to run pact_verifier_cli commands"
        puts "# sudo softwareupdate --install-rosetta --agree-to-license"
      end
    end
  end

  test do
    system "#{bin}/pact_verifier_cli", "--help"
  end
end
