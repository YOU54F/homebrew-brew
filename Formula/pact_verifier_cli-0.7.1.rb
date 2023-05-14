class PactVerifierCli071 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.7.1/pact_verifier_cli-osx-x86_64.gz"
      sha256 "50ec60cd7503d645dd8760ba3894963f1642ef32b39e174b6261f641a6e61b5c"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.7.1/pact_verifier_cli-osx-x86_64.gz"
      sha256 "50ec60cd7503d645dd8760ba3894963f1642ef32b39e174b6261f641a6e61b5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.7.1/pact_verifier_cli-linux-x86_64.gz"
      sha256 "93350e2c564c50f66c950ec6e50c09dab22ba895c20685fa47f77590e1ab2b2f"
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
