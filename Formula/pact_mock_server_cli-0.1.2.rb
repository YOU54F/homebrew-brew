class PactMockServerCli012 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.2/pact_mock_server_cli-osx-x86_64-0.1.2.gz"
      sha256 "1853cf1cc18ca95a64bbcdc2a9f0fe58c2d179da11f7aeef3b43c66e79be5851"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.2/pact_mock_server_cli-osx-x86_64-0.1.2.gz"
      sha256 "1853cf1cc18ca95a64bbcdc2a9f0fe58c2d179da11f7aeef3b43c66e79be5851"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.2/pact_mock_server_cli-linux-x86_64-0.1.2.gz"
      sha256 "73a3fc763d85a6a9e6fb1fea353e85e42670c00fae029bf95a95e5e748674ea0"
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
