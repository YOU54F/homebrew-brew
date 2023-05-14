class PactRubyStandalone1702 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.70.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.70.2/pact-1.70.2-osx.tar.gz"
      sha256 "d07c105ae5599186b2c40499ccd12c1294f4b0b8bbc5ce1c1baf8fd989abc44a"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.70.2/pact-1.70.2-osx.tar.gz"
      sha256 "d07c105ae5599186b2c40499ccd12c1294f4b0b8bbc5ce1c1baf8fd989abc44a"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.70.2/pact-1.70.2-linux-x86_64.tar.gz"
        sha256 "5a943118f2520462fdcc74e08bb0de9164cfbfce0db1c74495e0e6a3852676e4"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.70.2/pact-1.70.2-linux-x86.tar.gz"
        sha256 "c74b669a3464009d4a1ae2824176fbbe14735f24aca0f033a1d4204c12108bfb"
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
