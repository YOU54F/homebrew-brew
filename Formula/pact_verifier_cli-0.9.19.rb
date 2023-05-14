class PactVerifierCli0919 < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.9.19"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.19/pact_verifier_cli-osx-aarch64.gz"
      sha256 "afd867ea675db689d6a3a60ef37e011e27cf6c43f78f4c050ea1785c250b8423"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.19/pact_verifier_cli-osx-x86_64.gz"
      sha256 "be704dffb58ce8ba4f5463e0945c40a4e548ae6689ca77c1cf9398cc3187acc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.19/pact_verifier_cli-linux-aarch64.gz"
      sha256 "251bc6bd9927de46f9e78c0af823a5ddf1eeaa5445584c8f12931a5d392ebe65"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.9.19/pact_verifier_cli-linux-x86_64.gz"
      sha256 "dd34e5db6e68a2cb40838821478bcb1ea2291322121b455c3af6a713f92e9bd9"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact_verifier_cli --help'"
  end

  test do
    system "#{bin}/pact_verifier_cli", "help"
  end
end
