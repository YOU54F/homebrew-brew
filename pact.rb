class Pact < Formula
  desc "🔗 Pact in a single binary - Mock/Stub Server, Provider Verifier, Broker Client & Plugin CLI"
  homepage "https://docs.pact.io"
  license "MIT"
  version "0.9.0"
  head "https://github.com/YOU54F/pact-cli.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  on_macos do
    on_intel do
      url "https://github.com/YOU54F/pact-cli/releases/download/v0.9.0/pact-v0.9.0-x86_64-apple-darwin"
      sha256 "adf97e86f65f317b94d4568eb9d11f42642eead2f4a6fecd39b9cbe23962abf4"

      def install
        bin.install "pact"
      end
    end

    on_arm do
      url "https://github.com/YOU54F/pact-cli/releases/download/v0.9.0/pact-v0.9.0-aarch64-apple-darwin"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "pact"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YOU54F/pact-cli/releases/download/v0.9.0/pact-v0.9.0-x86_64-unknown-linux-gnu"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "pact"
      end
    end

    on_arm do
      url "https://github.com/YOU54F/pact-cli/releases/download/v0.9.0/pact-v0.9.0-aarch64-unknown-linux-gnu"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "pact"
      end
    end
  end

  def install
    # Build from source if no precompiled binary is available
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      🚀 Pact CLI with Extensions is now installed!

      Quick start:
        pact --help                           # Show all available commands
        pact extension list                   # List available extensions
        pact extension install pactflow-ai    # Install PactFlow AI extension
        pact pactflow ai --help              # Use PactFlow AI seamlessly

      📖 Documentation:
        - Extensions: https://github.com/YOU54F/pact-cli/blob/main/EXTENSIONS.md
        - Pact Docs: https://docs.pact.io

      🔧 Configuration:
        Extensions are installed to: ~/.pact/extensions/
        Override with: export PACT_CLI_EXTENSIONS_HOME=/custom/path

      💡 The Pact CLI includes:
        - Mock Server (pact mock)
        - Provider Verifier (pact verifier)
        - Stub Server (pact stub)
        - Broker Client (pact broker)
        - PactFlow Client (pact pactflow)
        - Plugin CLI (pact plugin)
        - Extension System (pact extension)

      🔄 Installation options:
        - Precompiled binaries (default, fastest)
        - From source with Cargo (brew install --build-from-source pact)
        - Development version (brew install --HEAD pact)
    EOS
  end

  test do
    # Test basic functionality
    assert_match "Pact in a single binary", shell_output("#{bin}/pact --help")
    
    # Test version output
    version_output = shell_output("#{bin}/pact --version")
    assert_match version.to_s, version_output
    
    # Test extension system
    extension_help = shell_output("#{bin}/pact extension --help")
    assert_match "Manage Pact CLI extensions", extension_help
    
    # Test subcommand availability and help output
    %w[mock verifier stub broker pactflow plugin extension].each do |cmd|
      help_output = shell_output("#{bin}/pact #{cmd} --help")
      assert_match cmd, help_output.downcase
    end
  end
end
