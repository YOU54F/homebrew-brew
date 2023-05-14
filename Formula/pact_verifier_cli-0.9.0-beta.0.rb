class PactVerifierCli090-beta < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.0-beta.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.0-beta.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "4e0c0a74ee5f4f91185f6793038a91fd93630c9a4508ccb054b5a8b34d47080b"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.0-beta.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "4e0c0a74ee5f4f91185f6793038a91fd93630c9a4508ccb054b5a8b34d47080b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.0-beta.0/pact_verifier_cli-linux-x86_64.gz"
      sha256 "808719dbe1679184a722d7facadf0f3e3c27995b75881d4ea0733b3829806489"
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
