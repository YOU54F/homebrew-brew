class PactVerifierCli081 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.1/pact_verifier_cli-osx-x86_64.gz"
      sha256 "9e44fa485e14a0a1777b3d1fdf2aa1abf6fece2f835c0665469aa90f796bc7ea"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.1/pact_verifier_cli-osx-x86_64.gz"
      sha256 "9e44fa485e14a0a1777b3d1fdf2aa1abf6fece2f835c0665469aa90f796bc7ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.8.1/pact_verifier_cli-linux-x86_64.gz"
      sha256 "7b6fcd8684923d480968ea673eaa24a00d288f8e4d77f5fbf03e2a4c12147765"
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
