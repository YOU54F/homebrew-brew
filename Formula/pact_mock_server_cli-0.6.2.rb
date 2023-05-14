class PactMockServerCli062 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.6.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.6.2/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "90c25770d91c6c04d708295c6e7297a1c306cf9186f0f731909d0e9ccbb96e23"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.6.2/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "90c25770d91c6c04d708295c6e7297a1c306cf9186f0f731909d0e9ccbb96e23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.6.2/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "c305d186e3cd6d2f8ffc8346d1798b059736adfde1815e9f4e950ee3d17ebae2"
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
    system "#{bin}/pact_mock_server_cli", "help"
  end
end
