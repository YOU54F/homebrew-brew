class PactVerifierCli0912 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.12"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.12/pact_verifier_cli-osx-x86_64.gz"
      sha256 "0ee2232b60105a452789490dd2bdfdf1306c7c611101e9dbe4da2565d1474721"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.12/pact_verifier_cli-osx-x86_64.gz"
      sha256 "0ee2232b60105a452789490dd2bdfdf1306c7c611101e9dbe4da2565d1474721"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.12/pact_verifier_cli-linux-x86_64.gz"
      sha256 "bda8b0552a9d66442073815176802def3796e267d053f52479219ecb174e7635"
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
