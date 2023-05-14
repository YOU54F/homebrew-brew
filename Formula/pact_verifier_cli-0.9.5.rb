class PactVerifierCli095 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.5/pact_verifier_cli-osx-x86_64.gz"
      sha256 "8ff37c3bcc98851a3fac678e4d6c65f0e3ed7db680b7bbc44a1a73f8c4b0cbf8"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.5/pact_verifier_cli-osx-x86_64.gz"
      sha256 "8ff37c3bcc98851a3fac678e4d6c65f0e3ed7db680b7bbc44a1a73f8c4b0cbf8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.5/pact_verifier_cli-linux-x86_64.gz"
      sha256 "ead7fdf445cc78f7b53236ae19885c923596e41e999c4007213ce7d5cc1345b6"
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
