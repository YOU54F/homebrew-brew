class PactVerifierCli098 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.8"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.8/pact_verifier_cli-osx-x86_64.gz"
      sha256 "b95384df173717a807d3ed3d5b224dfa56dcfdce0c7cfb9748a8c423932eccfe"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.8/pact_verifier_cli-osx-x86_64.gz"
      sha256 "b95384df173717a807d3ed3d5b224dfa56dcfdce0c7cfb9748a8c423932eccfe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.8/pact_verifier_cli-linux-x86_64.gz"
      sha256 "8b2bdf558a2c61ce122925e8b1161cba7d8a02c0fbb224020d2bd2b7a5d510be"
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
