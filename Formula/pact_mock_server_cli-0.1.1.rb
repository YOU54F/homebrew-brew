class PactMockServerCli011 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.1/pact_mock_server_cli-osx-x86_64-0.1.1.gz"
      sha256 "6c7410a15612ef206a941cb2417795f024e9169c66770bebe64f3b54006e4534"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.1/pact_mock_server_cli-osx-x86_64-0.1.1.gz"
      sha256 "6c7410a15612ef206a941cb2417795f024e9169c66770bebe64f3b54006e4534"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.1/pact_mock_server_cli-linux-x86_64-0.1.1.gz"
      sha256 "b75de56d2c5b8bc94fd9668f81c0f95c0f259123693f957fdf9ad39aa0b3245f"
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
