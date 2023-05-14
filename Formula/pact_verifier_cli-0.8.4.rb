class PactVerifierCli084 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.4/pact_verifier_cli-osx-x86_64.gz"
      sha256 "c0dd3e145569d564488c6f5f4a75e3d57fd7d51b9120f456113ed72b75b412df"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.4/pact_verifier_cli-osx-x86_64.gz"
      sha256 "c0dd3e145569d564488c6f5f4a75e3d57fd7d51b9120f456113ed72b75b412df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.4/pact_verifier_cli-linux-x86_64.gz"
      sha256 "155b420828e8efee26d0fd9caaeb766397d952e9db6d83569f3742c73dc94ab4"
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
