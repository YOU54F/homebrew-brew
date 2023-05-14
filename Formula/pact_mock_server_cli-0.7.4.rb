class PactMockServerCli074 < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.7.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.4/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "085e237e84cb97d8dcda87eec2e0c8439e481b69ee4c1c22d5cfafedf039c1ae"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.4/pact_mock_server_cli-osx-x86_64.gz"
      sha256 "085e237e84cb97d8dcda87eec2e0c8439e481b69ee4c1c22d5cfafedf039c1ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v0.7.4/pact_mock_server_cli-linux-x86_64.gz"
      sha256 "f937021f3088732e3f9f38d9b262a97d1b972ff9f139c695e4cde50191b82c13"
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
