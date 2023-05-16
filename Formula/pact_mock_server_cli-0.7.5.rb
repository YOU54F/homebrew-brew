class PactMockServerCli075 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.5/pact_mock_server_cli-osx-x86_64-0.7.5.gz"
      sha256 "c3f71a656e0cd03d2c216746d530b69568932d790f40a107bcda43d7736e4dfb"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.5/pact_mock_server_cli-osx-x86_64-0.7.5.gz"
      sha256 "c3f71a656e0cd03d2c216746d530b69568932d790f40a107bcda43d7736e4dfb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.5/pact_mock_server_cli-linux-x86_64-0.7.5.gz"
      sha256 "7d56008a25136d7626773ea29f80d837d8904818e987e37c9b905e0338daec32"
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
