class PactVerifierCli0917 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.17"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.17/pact_verifier_cli-osx-aarch64.gz"
      sha256 "aacad251c60b9650aec50572ea10f1539f6d14eb462c3b7258f5d272ff3296e4"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.17/pact_verifier_cli-osx-x86_64.gz"
      sha256 "0be18322a922cba27f12cbd2b0636b383633aff0b1d0a5d17cf62e0d5f6b68fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.17/pact_verifier_cli-linux-aarch64.gz"
      sha256 "747575bc210ae38c99b9456c092fb13ff7808ca538e54ffb40d1bcae6d4039f7"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.17/pact_verifier_cli-linux-x86_64.gz"
      sha256 "7a190e5709822024eef1dec0c2444970ea3b823ee346410aadd159fbe2434e68"
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
