class PactMockServerCli078 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.8"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.8/pact_mock_server_cli-osx-x86_64-0.7.8.gz"
      sha256 "e54e4eb1dcae288a1168a9fcdd26433b3388ffba8d9b6443efcefb1028492e55"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.8/pact_mock_server_cli-osx-x86_64-0.7.8.gz"
      sha256 "e54e4eb1dcae288a1168a9fcdd26433b3388ffba8d9b6443efcefb1028492e55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/"
      sha256 "7799ee2f056f3bfb6eb3c5227716c03eade28d6f5ddda68cf2000956cfbc81c6"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.8/pact_mock_server_cli-linux-x86_64-0.7.8.gz"
      sha256 "e348c6cb4a40a0800b4b6f6c77a8d4fc55bee19a9173f557a87b9d9f53745f5d"
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
