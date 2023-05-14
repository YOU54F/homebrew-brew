class PactVerifierCli093 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.3/pact_verifier_cli-osx-x86_64.gz"
      sha256 "3b2e7fae032ed8260b639ee168b6f98479ab8ef57ad825ec1a0fac3aa6873d12"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.3/pact_verifier_cli-osx-x86_64.gz"
      sha256 "3b2e7fae032ed8260b639ee168b6f98479ab8ef57ad825ec1a0fac3aa6873d12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.3/pact_verifier_cli-linux-x86_64.gz"
      sha256 "4b0d62360dab4b8859d247f3cc3b2b55f23a2cb31d74021a5bed23ecff7d2a72"
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
