class PactMockServerCliAT0 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.7"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.7/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "4753df4c50fd68b37aae24a853f4828bfd557ecaba7d647d7619e9a6f142e2d9"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.7/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "4753df4c50fd68b37aae24a853f4828bfd557ecaba7d647d7619e9a6f142e2d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.7/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "da6c709d5651d12fa7f3e0ce66f74ddb3922ce347a94c799d21cc3cc6ce81e46"
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
