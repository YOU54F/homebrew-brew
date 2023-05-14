class PactVerifierCli0910 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.10"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.10/pact_verifier_cli-osx-x86_64.gz"
      sha256 "154f1d5ac88322cb43ec76c0f3f502ba2c4484095ead5199533eea2e595e318f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.10/pact_verifier_cli-osx-x86_64.gz"
      sha256 "154f1d5ac88322cb43ec76c0f3f502ba2c4484095ead5199533eea2e595e318f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.10/pact_verifier_cli-linux-x86_64.gz"
      sha256 "c45b4f848add31db4db2a7ae3efde07dff875902b83fb677332a5ff2d99827d7"
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
