class PactVerifierCli0102 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.10.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.2/pact_verifier_cli-osx-aarch64.gz"
      sha256 "48b9d6ccfcd66b798a183ebd9e175e877ac48e722735fc5618737d116de6f0a8"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.2/pact_verifier_cli-osx-x86_64.gz"
      sha256 "929bbffabc8daa30acecfe8fd017d2e8af7039ccc1ef5a18f23ad95b7de49071"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.2/pact_verifier_cli-linux-aarch64.gz"
      sha256 "b3cd5f634efe5966e666ed08a6b87e692bb59c75475a67b19c710528e99348db"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.2/pact_verifier_cli-linux-x86_64.gz"
      sha256 "c6f7fa61e2dc06e2f4f3850a9099558a03c40ab8352d20dc00b2c2cedd2277b6"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact_verifier_cli --help'"
  end

  test do
    system "#{bin}/pact_verifier_cli", "--help"
  end
end
