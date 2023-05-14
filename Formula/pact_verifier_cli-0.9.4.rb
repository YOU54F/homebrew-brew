class PactVerifierCli094 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.4/pact_verifier_cli-osx-x86_64.gz"
      sha256 "f4794ede42ea88f073a1352ec4abdd90ebfbf04ec763addae2387421fe74ac77"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.4/pact_verifier_cli-osx-x86_64.gz"
      sha256 "f4794ede42ea88f073a1352ec4abdd90ebfbf04ec763addae2387421fe74ac77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.4/pact_verifier_cli-linux-x86_64.gz"
      sha256 "6155138c33f522bc170a34805f4a95ca5c34c06e84d66766af402bb2dbc5c8bf"
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
