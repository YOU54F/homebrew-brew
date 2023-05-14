class PactVerifierCli0918 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.18"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.18/pact_verifier_cli-osx-aarch64.gz"
      sha256 "350abf9abef8fa7e1b58457b3fc258a181175412639da996ab66db78eeede067"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.18/pact_verifier_cli-osx-x86_64.gz"
      sha256 "c429cb601b3f5428d2e5581ab2f9c0e77b28dc6349799d56fa3805b1c96615ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.18/pact_verifier_cli-linux-aarch64.gz"
      sha256 "44db41752e1afe70a726ab48647f938fc11655a2695c9eb4563262548692b6b0"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.18/pact_verifier_cli-linux-x86_64.gz"
      sha256 "eccbb92c4acfba777c1775722f6608522e6d59159bf465b3add8c3dc7105ac7c"
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
