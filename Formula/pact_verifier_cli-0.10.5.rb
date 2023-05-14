class PactVerifierCli0105 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.10.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-osx-aarch64.gz"
      sha256 "e6651e4dab1ad381d9f34fa3a9f12c7756b1bf778d864ab0893fa6078b2a98e8"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-osx-x86_64.gz"
      sha256 "042ba537784472a65722d5b1301f4d1d61486d7220fbae2691812c44f58350dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-linux-aarch64.gz"
      sha256 "48a5d6bbc5471764e77027eaf42f62f812849b083e267be2cb8ed9d36cc862bf"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-linux-x86_64.gz"
      sha256 "8426c38ca361613bc4df649f14e40c9c3609672b56797e3c487aba2860c5040d"
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
