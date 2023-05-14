class PactMockServerCli071 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.1/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "97b51a8d07d3a0d5cff84b83274ddb9717e1c6cb120ef5a9ddc5739628da76f0"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.1/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "97b51a8d07d3a0d5cff84b83274ddb9717e1c6cb120ef5a9ddc5739628da76f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.1/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "279145943357d1d659034f4fd81daba65bb0b444bb9380ef2af57dd4e11f0eaf"
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
