class PactVerifier < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/you54f/pact-reference"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-macos-aarch64.gz"
      sha256 "f77f897beeacf6d4b67d6c43c70651912f003cf852e68629e8772648fba364a0"
    end
    on_intel do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-macos-x86_64.gz"
      sha256 "f2554fd3edb3296e2963a40b0428a4f51fec37f76f15e359c7af27a545ab5161"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-linux-aarch64.gz"
      sha256 "4457844674440feefe773c55fb94b82d2bd4e9e12d5f91f2a40569df379198d3"
    end
    on_intel do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-linux-x86_64.gz"
      sha256 "f02275a64ceacabeaf6a5128e9b8f004f51354f6c1ff83cdc6e6b218ba34da0a"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact-verifier --help'"
  end

  test do
    system "#{bin}/pact-verifier", "--help"
  end
end
