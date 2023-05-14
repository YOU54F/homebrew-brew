class PactVerifierCli097 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.7"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.7/pact_verifier_cli-osx-x86_64.gz"
      sha256 "804de964e98db9ce47ed45c7a4f04c9a08e8e01b7b5d37a50ed7f10e3585cc4d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.7/pact_verifier_cli-osx-x86_64.gz"
      sha256 "804de964e98db9ce47ed45c7a4f04c9a08e8e01b7b5d37a50ed7f10e3585cc4d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.7/pact_verifier_cli-linux-x86_64.gz"
      sha256 "cd8b6dfbd0d5dcc890b978398d07cad03caff81ba6174183aa3ecf48e47925a5"
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
