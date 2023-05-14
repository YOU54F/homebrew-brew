class PactVerifierCli0914 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.14"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.14/pact_verifier_cli-osx-x86_64.gz"
      sha256 "474674d94490074b5b43f10833fad2195b282869bfaccbf975d82b1fb0aa36ff"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.14/pact_verifier_cli-osx-x86_64.gz"
      sha256 "474674d94490074b5b43f10833fad2195b282869bfaccbf975d82b1fb0aa36ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.14/pact_verifier_cli-linux-aarch64.gz"
      sha256 "dcc5f1ff3201db5844086bb1ec78dc6fd242951dbae64cc3fb93e94e142b1787"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.14/pact_verifier_cli-linux-x86_64.gz"
      sha256 "00e06fea9ea76a66dcb55b2154937d8073bc98443ba8b653e2c8940dac5241af"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact_verifier_cli --help'"
    on_macos do
      on_arm do
        puts "# Rosetta is required to run pact_verifier_cli commands"
        puts "# sudo softwareupdate --install-rosetta --agree-to-license"
      end
    end
  end

  test do
    system "#{bin}/pact_verifier_cli", "--help"
  end
end
