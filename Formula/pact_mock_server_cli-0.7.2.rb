class PactMockServerCli072 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.2/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "cf49c376fb286929069dfa79a64b080f1a02a4cf58a3a63e7559444443f41fce"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.2/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "cf49c376fb286929069dfa79a64b080f1a02a4cf58a3a63e7559444443f41fce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.2/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "aed68d9029e0747738aa936e3b0e82ee68d5ca56ffe7c6972456e6c82f38ee26"
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
