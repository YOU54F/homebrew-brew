class PactMockServerCli023 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.3/pact_mock_server_cli-osx-x86_64-0.2.3.gz"
      sha256 "a651dbc749e7df90d54575cb5e69c9f5e3949607b32de121419ab7745aa1d07f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.3/pact_mock_server_cli-osx-x86_64-0.2.3.gz"
      sha256 "a651dbc749e7df90d54575cb5e69c9f5e3949607b32de121419ab7745aa1d07f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.3/pact_mock_server_cli-linux-x86_64-0.2.3.gz"
      sha256 "ce08a96a47efa29fb8f71e00e2dd9938c4160f1276489433507c565ebadca726"
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
    system "#{bin}/pact_mock_server_cli", "--help"
  end
end
