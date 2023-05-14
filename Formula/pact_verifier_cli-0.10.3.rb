class PactVerifierCli0103 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.10.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.3/pact_verifier_cli-osx-aarch64.gz"
      sha256 "614ed4248066ff5c79c5fe19a6cc91b31498ba8809475dbc4a215498d4113914"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.3/pact_verifier_cli-osx-x86_64.gz"
      sha256 "fb66d7abbf6a520c024a2721c490780ab5858d9548c1bb55ac916fcb3c35765f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.3/pact_verifier_cli-linux-aarch64.gz"
      sha256 "635b3efc5c9d07f4f6a9ce60ce3691e96602185a0415cc692a936e803b2a125d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.3/pact_verifier_cli-linux-x86_64.gz"
      sha256 "f72a75ec4e4077b2765c3445a5a1a24b081ad3234b37663c3fbe2391b510f9f3"
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
