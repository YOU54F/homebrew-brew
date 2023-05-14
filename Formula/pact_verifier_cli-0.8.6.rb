class PactVerifierCli086 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.6"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.6/pact_verifier_cli-osx-x86_64.gz"
      sha256 "659614b4e8f4370a8e16ea68ec0f775b7eb9df5d6f5eb930216cec70c0322d50"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.6/pact_verifier_cli-osx-x86_64.gz"
      sha256 "659614b4e8f4370a8e16ea68ec0f775b7eb9df5d6f5eb930216cec70c0322d50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.6/pact_verifier_cli-linux-x86_64.gz"
      sha256 "763ec6a4657c54c4fe92cbf067d5374e045480e1f857748ff69086fe4aa18b3a"
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
