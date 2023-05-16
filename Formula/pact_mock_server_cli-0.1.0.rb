class PactMockServerCli010 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.0/pact_mock_server_cli-osx-x86_64-0.1.0.gz"
      sha256 "3b00d29083a770bf7ce579169e92dda397fca6575a4dd33fb7ca6ee183f526de"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.0/pact_mock_server_cli-osx-x86_64-0.1.0.gz"
      sha256 "3b00d29083a770bf7ce579169e92dda397fca6575a4dd33fb7ca6ee183f526de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.1.0/pact_mock_server_cli-linux-x86_64-0.1.0.gz"
      sha256 "19a78cc30a4d5f5a81d7d1e4eba603a904cc6617175174e96e0c2bba3e4020fa"
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
