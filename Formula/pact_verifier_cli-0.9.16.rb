class PactVerifierCli0916 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.16"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.16/pact_verifier_cli-osx-aarch64.gz"
      sha256 "e58405039356a3a08915d01260f204d23aba034fd406e2a513a90eecf775c1d2"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.16/pact_verifier_cli-osx-x86_64.gz"
      sha256 "52dfcd7974f93a4b133f04743c89b2ab5c6c82c109b4e38ea5b6dd60a8a65125"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.16/pact_verifier_cli-linux-aarch64.gz"
      sha256 "dd2f8dfa03afdda58ca6751827ad28d9ba67f238e46039aca68b805b285e9217"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.16/pact_verifier_cli-linux-x86_64.gz"
      sha256 "7bb8d646c0ced8c869f8b85a34ec9a224c531c4cc6f4a2db94403afd9d7cd246"
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
