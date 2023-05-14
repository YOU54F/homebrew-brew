class PactVerifierCli0100 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.0/pact_verifier_cli-osx-aarch64.gz"
      sha256 "b33746162477eb89a57bd6a3df31c3b559120e1219b783a09a398b99ff25452d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "d0d5846507b287ddb21dee3c395454ff7bc7a236beb2fcf1e3cae6a24fa84282"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.0/pact_verifier_cli-linux-aarch64.gz"
      sha256 "346dc54743de8343c93f903f276ce72a61c63b913c4ed4bca6e4c674335127a8"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.0/pact_verifier_cli-linux-x86_64.gz"
      sha256 "072a8fb84e49b71874652241cbcdff0e17be7fd4052b38fb5ca059dc1dbffb98"
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
