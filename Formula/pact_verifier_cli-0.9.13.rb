class PactVerifierCli0913 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.13"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.13/pact_verifier_cli-osx-x86_64.gz"
      sha256 "068d226606ce2453e77fdbf227b5fc21fd72b51622b4b5a9743af84e02f33051"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.13/pact_verifier_cli-osx-x86_64.gz"
      sha256 "068d226606ce2453e77fdbf227b5fc21fd72b51622b4b5a9743af84e02f33051"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.13/pact_verifier_cli-linux-x86_64.gz"
      sha256 "5fefc0f708f4bb8416b6acaf3293c445db8b936d6b9da628d4a6c1f3b31c3e81"
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
