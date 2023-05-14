class PactVerifierCli099 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.9"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.9/pact_verifier_cli-osx-x86_64.gz"
      sha256 "fdbad7383ebf25df4b52245b02c3c9431c47bc4ac196d057abf5fdbf6d5643de"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.9/pact_verifier_cli-osx-x86_64.gz"
      sha256 "fdbad7383ebf25df4b52245b02c3c9431c47bc4ac196d057abf5fdbf6d5643de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.9/pact_verifier_cli-linux-x86_64.gz"
      sha256 "41f74b4fbf838123c45844acf60fd94b5d18e9299d2eb518b83c92e136abb841"
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
