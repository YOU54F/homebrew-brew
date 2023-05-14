class PactVerifierCli070 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.7.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "83e3e57f263b1d1f56e7a8322b39a075a5706967b286b06156ca4c8fb57f62b5"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.7.0/pact_verifier_cli-osx-x86_64.gz"
      sha256 "83e3e57f263b1d1f56e7a8322b39a075a5706967b286b06156ca4c8fb57f62b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.7.0/pact_verifier_cli-linux-x86_64.gz"
      sha256 "c5dd1a734ad550a381f5904e27947fe44067da650061b567b40700c368aaed27"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact_verifier_cli --help'"
    on_macos do
      on_arm do
        puts "# Rosetta is required to run pact_verifier_cli commands"
        puts "# sudo softwareupdate --install-rosetta --agree-to-license"
      end
    end
  end

  test do
    system "#{bin}/pact_verifier_cli", "help"
  end
end
