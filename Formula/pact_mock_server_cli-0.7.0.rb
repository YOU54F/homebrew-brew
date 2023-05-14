class PactMockServerCli070 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.0/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "c7b61ae6ea1f937ab66df425560b8c56c63718d79eefe620a73c023272bcd026"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.0/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "c7b61ae6ea1f937ab66df425560b8c56c63718d79eefe620a73c023272bcd026"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.0/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "5305bbd89f0bc8f4c7cd7a61f9c79fe0cc0fbe6d7ae9fd6409758f53978c1e72"
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
