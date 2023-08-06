class PactRubyStandaloneAT2 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "2.0.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v2.0.1/pact-2.0.1-osx-arm64.tar.gz"
      sha256 "99802ed777d29afe53974d6e6eb6c202b34cb6b8cc09c04b341f5f507d6da3ec"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v2.0.1/pact-2.0.1-osx-x86_64.tar.gz"
      sha256 "a22f539287705ef5180c8aa9cddef1ec3745c3ef3ee9d1c4308c943e2f1c01bb"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_arm do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v2.0.1/pact-2.0.1-linux-arm64.tar.gz"
        sha256 "736411ca0839995cae0c5af433b4f51a7909ea976c474b97202fef3efb5c56a1"
      end
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v2.0.1/pact-2.0.1-linux-x86_64.tar.gz"
        sha256 "f54e31b376bc230cf7739bc9ff1c4f4dab124ce8cd69e66224dc93b5d97dad53"
      end
    end
  end

  def install
    # pact-ruby-standalone
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/pact"
    bin.install_symlink "#{libexec}/pact-broker"
    bin.install_symlink "#{libexec}/pact-message"
    bin.install_symlink "#{libexec}/pact-mock-service"
    bin.install_symlink "#{libexec}/pact-plugin-cli"
    bin.install_symlink "#{libexec}/pact-provider-verifier"
    bin.install_symlink "#{libexec}/pact-stub-service"
    bin.install_symlink "#{libexec}/pactflow"
    puts "# (see https://github.com/pact-foundation/pact-ruby-standalone/releases/)'"
    puts "# Run 'pact --help'"
    puts "# Run 'pact-broker --help'"
    puts "# Run 'pact-message --help'"
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'plugin-cli --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
    puts "# Run 'pactflow --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-plugin-cli", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
    system "#{bin}/pactflow", "--help"

  end
end
