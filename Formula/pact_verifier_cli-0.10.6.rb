class PactVerifierCli0106 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.10.6"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.6/pact_verifier_cli-osx-aarch64.gz"
      sha256 "af2d659d0e96ed6234aed90ec5d5d743e69b2b636f89acd5547cabec11149c1e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.6/pact_verifier_cli-osx-x86_64.gz"
      sha256 "381882c142c616ce899cc927bf69302cff0a54625c6ee1dd95300ce53e4b9466"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.6/pact_verifier_cli-linux-aarch64.gz"
      sha256 "77c7737ee899849e56e558b6138af5b9de60433922d6e5ad574f2bb81bfa3805"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.6/pact_verifier_cli-linux-x86_64.gz"
      sha256 "a96f99e7599b56d856f63916e02dc52269f2caaa01139740edb234f78df963cf"
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
