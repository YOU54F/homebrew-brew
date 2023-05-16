class PactMockServerCli002 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.0.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.0.2/pact_mock_server_cli-osx-x86_64-0.0.2.gz"
      sha256 "a6630427a994779e27c718865fff3d5526ccb4a4b2377a50df4f9bd0fe8ba238"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.0.2/pact_mock_server_cli-osx-x86_64-0.0.2.gz"
      sha256 "a6630427a994779e27c718865fff3d5526ccb4a4b2377a50df4f9bd0fe8ba238"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.0.2/pact_mock_server_cli-linux-x86_64-0.0.2.gz"
      sha256 "911f72eb0dbb439524cde66dea1d8630746ff39fb01529ecd1d6fb6353835034"
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
