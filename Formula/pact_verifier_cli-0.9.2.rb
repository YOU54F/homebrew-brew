class PactVerifierCli092 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.2/pact_verifier_cli-osx-x86_64.gz"
      sha256 "0af658b3ff5bfa5e869ffc3cd4d29f458035bc2a1590bc9dc2466d6ffacb0a8a"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.2/pact_verifier_cli-osx-x86_64.gz"
      sha256 "0af658b3ff5bfa5e869ffc3cd4d29f458035bc2a1590bc9dc2466d6ffacb0a8a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.2/pact_verifier_cli-linux-x86_64.gz"
      sha256 "71a4e71975a42b37b493cfc87d1cd605b3126ab6b862e489e4a00e271c8d52a2"
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
    system "#{bin}/pact_verifier_cli", "help"
  end
end
