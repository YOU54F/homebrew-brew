class PactVerifierCli0915 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.15"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.15/pact_verifier_cli-osx-aarch64.gz"
      sha256 "03671a899052698c81e5182ff23fc71ef3cca9c80098e79f52fe29c6dd8a8387"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.15/pact_verifier_cli-osx-x86_64.gz"
      sha256 "84352c740e497f6867d1db08d7bcdedb47a385c0b08c54c22de90ef5d92dc304"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.15/pact_verifier_cli-linux-aarch64.gz"
      sha256 "76a16f145ee1c97258b286c8d1f363e278e68f5e6c10e92f728ddcbf8db01a3d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.15/pact_verifier_cli-linux-x86_64.gz"
      sha256 "8a47c8361f04a2b8c280124d71cf4e5119ab6f3efa374c083b2aa50c30ee616b"
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
