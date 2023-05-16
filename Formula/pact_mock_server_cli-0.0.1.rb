class PactMockServerCli001 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.0.1/pact_mock_server_cli-osx-x86_64-0.0.1.gz"
      sha256 "32c4fcd1041e0ab5808f90a36de67db33f15e84d98ad6fd39c1107300ac3d30a"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.0.1/pact_mock_server_cli-osx-x86_64-0.0.1.gz"
      sha256 "32c4fcd1041e0ab5808f90a36de67db33f15e84d98ad6fd39c1107300ac3d30a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.0.1/pact_mock_server_cli-linux-x86_64-0.0.1.gz"
      sha256 "48764cd2e9705a39498108193ee28309dbcca70c4ab5eb637326a52625493267"
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
