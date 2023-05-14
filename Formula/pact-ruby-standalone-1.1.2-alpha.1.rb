class PactRubyStandalone112-alpha < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.1.2-alpha.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2-alpha.1/pact-1.1.2-alpha.1-osx.tar.gz"
      sha256 "333583499243309b174f958e550280eef0c4e7eb6f1a51c955d4552ef6923347"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2-alpha.1/pact-1.1.2-alpha.1-osx.tar.gz"
      sha256 "333583499243309b174f958e550280eef0c4e7eb6f1a51c955d4552ef6923347"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2-alpha.1/pact-1.1.2-alpha.1-linux-x86_64.tar.gz"
        sha256 "4ca6980b30841c9819d495e9e740fcb055cf5405a2e104ea1744dd46f171d463"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2-alpha.1/pact-1.1.2-alpha.1-linux-x86.tar.gz"
        sha256 "eb6263877594b275175b67033f1e4f3a76ce90983c722452a7fe8b0e30145438"
      end
    end
  end

  def install
    # pact-ruby-standalone
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    puts "# (see https://github.com/pact-foundation/pact-ruby-standalone/releases/)'"
    puts "# Run 'pact --help'"
    puts "# Run 'pact-broker --help'"
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
