class PactMockServerCli061 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.6.1/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "61dca1f367b2ce8a7540d7b7501ea2e7130ff9c78c090c43053a77362f6f4515"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.6.1/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "61dca1f367b2ce8a7540d7b7501ea2e7130ff9c78c090c43053a77362f6f4515"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.6.1/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "e89b080004021455b5282f8db7b421648c6b0f429aea7cdd6d9cee94f14057cc"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact_mock_server_cli --help'"
    on_macos do
      on_arm do
        puts "# Rosetta is required to run pact_mock_server_cli commands"
        puts "# sudo softwareupdate --install-rosetta --agree-to-license"
      end
    end
  end

  test do
    system "#{bin}/pact_mock_server_cli", "help"
  end
end
