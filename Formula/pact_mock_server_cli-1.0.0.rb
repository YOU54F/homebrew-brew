class PactMockServerCli100 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "4f29dc624dd1b4862170c029e59ba648dcf9cb9d306ca79279b3897d7e0faf56"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "4f29dc624dd1b4862170c029e59ba648dcf9cb9d306ca79279b3897d7e0faf56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-linux-aarch64.gz"
      sha256 "3445c2109ec1fc7a58d012c5a851f67203a6b19e3ef7f21d09fdac6b3d140f30"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "f07fe85eab349d9d8f6f60faffb8d4af02d8d0bbe8e7a756b6b5e136a837cd92"
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
