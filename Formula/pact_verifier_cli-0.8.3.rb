class PactVerifierCli083 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.3/pact_verifier_cli-osx-x86_64.gz"
      sha256 "7db1c3f75bf8c37d86cdd9b559f2ac8a29fb1666660e7f785b0b4c77b6279e07"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.3/pact_verifier_cli-osx-x86_64.gz"
      sha256 "7db1c3f75bf8c37d86cdd9b559f2ac8a29fb1666660e7f785b0b4c77b6279e07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.3/pact_verifier_cli-linux-x86_64.gz"
      sha256 "0ba860b30c0058f73101c98507b40a0e71489f7070f6ec7abbd840d889be6c24"
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
