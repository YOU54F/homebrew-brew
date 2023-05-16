class PactMockServerCli020 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.0/pact_mock_server_cli-osx-x86_64-0.2.0.gz"
      sha256 "f7e3706cc519805e6c54111588bd5e8888c66c76df4ee3184a11b0b68d91e7cb"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.0/pact_mock_server_cli-osx-x86_64-0.2.0.gz"
      sha256 "f7e3706cc519805e6c54111588bd5e8888c66c76df4ee3184a11b0b68d91e7cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.2.0/pact_mock_server_cli-linux-x86_64-0.2.0.gz"
      sha256 "8d69835f89639a6ae1ea57b71a38268ee95d277fc197ca15f92cd7a56bb88051"
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
