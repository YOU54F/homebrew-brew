class PactVerifierCli096 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.6"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.6/pact_verifier_cli-osx-x86_64.gz"
      sha256 "641c2d13fec22b3a980e1d1c16aff23aa644b1ac7f94f2e7ac3b7780fe573f80"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.6/pact_verifier_cli-osx-x86_64.gz"
      sha256 "641c2d13fec22b3a980e1d1c16aff23aa644b1ac7f94f2e7ac3b7780fe573f80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.6/pact_verifier_cli-linux-x86_64.gz"
      sha256 "d3c5022edd5fcf3c05189a29dd66fcb7c5b68f48c40a3bc01bf6fc8e9b7d0028"
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
