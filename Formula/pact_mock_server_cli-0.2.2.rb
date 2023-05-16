class PactMockServerCli022 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.2/pact_mock_server_cli-osx-x86_64-0.2.2.gz"
      sha256 "74bd052a3570de404dcd5b6f37afc3d871f3b70acbdfe6b88c721c62118275f2"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.2/pact_mock_server_cli-osx-x86_64-0.2.2.gz"
      sha256 "74bd052a3570de404dcd5b6f37afc3d871f3b70acbdfe6b88c721c62118275f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.2/pact_mock_server_cli-linux-x86_64-0.2.2.gz"
      sha256 "b30bc1974d56c7dd846e90b5e6779802cacf503fa3f5d645118760bf17cd4eb1"
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
