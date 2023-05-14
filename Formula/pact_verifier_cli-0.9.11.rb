class PactVerifierCli0911 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.11"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.11/pact_verifier_cli-osx-x86_64.gz"
      sha256 "95d2c5186378d68f849a3cec0c59fead09a62a2ad2d1992802117de9952622fb"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.11/pact_verifier_cli-osx-x86_64.gz"
      sha256 "95d2c5186378d68f849a3cec0c59fead09a62a2ad2d1992802117de9952622fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.11/pact_verifier_cli-linux-x86_64.gz"
      sha256 "7ee8db47716e0deaebebf8d12712680fca7a9d08b0b3fcb36d80910aae3fdc4a"
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
