class PactVerifierCli085 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.5/pact_verifier_cli-osx-x86_64.gz"
      sha256 "cf24f213c8a80a437d9b09fd85a69b50cf24a9e6a6d17a61733c80a921abd8ae"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.5/pact_verifier_cli-osx-x86_64.gz"
      sha256 "cf24f213c8a80a437d9b09fd85a69b50cf24a9e6a6d17a61733c80a921abd8ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.5/pact_verifier_cli-linux-x86_64.gz"
      sha256 "bdc91a200ea2d22463809f0891dd2825ca036f4fb55af9e62d71197168b369ac"
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
