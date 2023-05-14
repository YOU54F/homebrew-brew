class PactVerifierCli082 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.2/pact_verifier_cli-osx-x86_64.gz"
      sha256 "0f129b13b03b1c17b7f97c5559a2de8b31c56be3f7e5284aceb137f019edccce"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.2/pact_verifier_cli-osx-x86_64.gz"
      sha256 "0f129b13b03b1c17b7f97c5559a2de8b31c56be3f7e5284aceb137f019edccce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.2/pact_verifier_cli-linux-x86_64.gz"
      sha256 "4b9d999b1670222c5943c8e0d1672677fe8f879f74cd9dbfd96c4c1c6862333c"
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
    system "#{bin}/pact_verifier_cli", "help"
  end
end
