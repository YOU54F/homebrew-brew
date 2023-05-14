class PactVerifierCli080 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "89c3a92dc99d06cf8b6556a3bd33e5aaa0210e12fd8c6fbd688456bf0b13c228"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "89c3a92dc99d06cf8b6556a3bd33e5aaa0210e12fd8c6fbd688456bf0b13c228"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.0/pact_verifier_cli-linux-x86_64.gz"
      sha256 "ff49821bc3bf6309d91521c2fa28b8e25536002b33db88eb75ca6b372aef0bb2"
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
