class PactVerifierCli0101 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.10.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.1/pact_verifier_cli-osx-aarch64.gz"
      sha256 "8d7da87f4e8043dfe5a409d1239e4c9c3ae5a5221fb2431e44697a37781ce840"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.1/pact_verifier_cli-osx-x86_64.gz"
      sha256 "02a6e4165d62bb8ecf027dce2a1f01db458ed8ac05a245266fc5d17dd6dcf6bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.1/pact_verifier_cli-linux-aarch64.gz"
      sha256 "99484fa0fb88373eb7b5afc8b93b748b26952e1878c20bcdd24fec8c971a929e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.1/pact_verifier_cli-linux-x86_64.gz"
      sha256 "0b3120ca8878677ef3fa5b4cca2f592f79ccb8f95999d853854ee7aad832be75"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact_verifier_cli --help'"
  end

  test do
    system "#{bin}/pact_verifier_cli", "help"
  end
end
