class PactVerifierCli088 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.8"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.8/pact_verifier_cli-osx-x86_64.gz"
      sha256 "08fbcda6a22c721cb8f0ffa3c07c95890a4f6fb8831678c5981e90fb4f493461"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.8/pact_verifier_cli-osx-x86_64.gz"
      sha256 "08fbcda6a22c721cb8f0ffa3c07c95890a4f6fb8831678c5981e90fb4f493461"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.8/pact_verifier_cli-linux-x86_64.gz"
      sha256 "da23cfac36ae55f8ea04a447c35fad008f84680376ddb44d5d0ed2e57f365b7e"
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
