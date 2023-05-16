class PactMockServerCli076 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.6"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.6/pact_mock_server_cli-osx-x86_64-0.7.6.gz"
      sha256 "4958f5647c978cb5b4fa25498438ee75e652ff1fc6ebb92d7a81a1b868c3c9a5"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.6/pact_mock_server_cli-osx-x86_64-0.7.6.gz"
      sha256 "4958f5647c978cb5b4fa25498438ee75e652ff1fc6ebb92d7a81a1b868c3c9a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.6/pact_mock_server_cli-linux-x86_64-0.7.6.gz"
      sha256 "291931d0c52931afddd3e852a375af3c045d69a156e26f76d3e376243d2dfa2a"
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
