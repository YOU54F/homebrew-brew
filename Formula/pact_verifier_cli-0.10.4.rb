class PactVerifierCli0104 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.10.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.4/pact_verifier_cli-osx-aarch64.gz"
      sha256 "2da5f3d6af1a247dbca2398be442aae9e134cb27dbf31d8bc36a4b45b2b286e1"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.4/pact_verifier_cli-osx-x86_64.gz"
      sha256 "b622a6ca730c5f547e19f4ba63cdca383073643894e1f6326b05e31c819ec6e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.4/pact_verifier_cli-linux-aarch64.gz"
      sha256 "adc37ba070a6c8a730a6ef245f3026ff35eddfd6e9a1b5b735ca60f4d7ef774d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.4/pact_verifier_cli-linux-x86_64.gz"
      sha256 "2bfa7b259e874820f657ff3e40b54ceca09b65558c84a9b9b4fdd435704267bf"
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
