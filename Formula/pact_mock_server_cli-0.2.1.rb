class PactMockServerCli021 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.1/pact_mock_server_cli-osx-x86_64-0.2.1.gz"
      sha256 "49ae259112a1c998f276f4443e5c9d7f31728035e6c50a5a96255b27128d8618"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.1/pact_mock_server_cli-osx-x86_64-0.2.1.gz"
      sha256 "49ae259112a1c998f276f4443e5c9d7f31728035e6c50a5a96255b27128d8618"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.1/pact_mock_server_cli-linux-x86_64-0.2.1.gz"
      sha256 "68edb9acd1be8562f1e51927a315d25eb968438651b369850d0efc0436ad78a6"
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
