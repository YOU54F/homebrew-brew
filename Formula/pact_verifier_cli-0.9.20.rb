class PactVerifierCli0920 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.20"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.20/pact_verifier_cli-osx-aarch64.gz"
      sha256 "781b10a82c3fe3236462e48e4c201f2775cf6080a785b1d49e7504d3d46252f3"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.20/pact_verifier_cli-osx-x86_64.gz"
      sha256 "c07a6dfe34e50153bc8ad7a3c91a4c0539e164c7f31ace9bb121592bb0fca7cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.20/pact_verifier_cli-linux-aarch64.gz"
      sha256 "57ddbad960a81ee4eed26f5356367dc8866c3e4868f687c32097b08056a4413f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.20/pact_verifier_cli-linux-x86_64.gz"
      sha256 "7813dada0db4f20e3e952a10df67296e0bbba802e8bfa064312fc6110790ca92"
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
