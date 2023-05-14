class PactVerifierCli087 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.7"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.7/pact_verifier_cli-osx-x86_64.gz"
      sha256 "9a9f473f1e2d4ee71c7fdac4b47cc7d9d08a6bedbec7f50cfe7eeb4cf94c6043"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.7/pact_verifier_cli-osx-x86_64.gz"
      sha256 "9a9f473f1e2d4ee71c7fdac4b47cc7d9d08a6bedbec7f50cfe7eeb4cf94c6043"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.7/pact_verifier_cli-linux-x86_64.gz"
      sha256 "f3e5c5c9bdca2a2716865531257b4d2b2bef2fbfd45954cf179345a12f0e48df"
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
