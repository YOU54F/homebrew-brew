class PactVerifierCli090 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "79c700f9335d6daf1efe200603c5a622048fd5f8788cb0fa9a446b8da3d5d3f2"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "79c700f9335d6daf1efe200603c5a622048fd5f8788cb0fa9a446b8da3d5d3f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.0/pact_verifier_cli-linux-x86_64.gz"
      sha256 "6da9c942f8bfde83790cb4b9294975948367331250502c5fa56c77381447265a"
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
