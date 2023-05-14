class PactRubyStandalone1888 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.8"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.8/pact-1.88.8-osx.tar.gz"
      sha256 "1c232dcfe2ef82bbe6f6cade2c2534b2bca18e4cdbada0ba29f88430fdd7b493"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.8/pact-1.88.8-osx.tar.gz"
      sha256 "1c232dcfe2ef82bbe6f6cade2c2534b2bca18e4cdbada0ba29f88430fdd7b493"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.8/pact-1.88.8-linux-x86_64.tar.gz"
        sha256 "28559aeaedec7739d0d652e3ceb20f212d61bbf16e1bf0cc8ca6cba24e71bf0d"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.8/pact-1.88.8-linux-x86.tar.gz"
        sha256 "a015d31e6dc158f4397c4e184db23b05fb9fe6c327d3f96b983a9214f6a2e7d7"
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
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
    puts "# Run 'pactflow --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
    system "#{bin}/pactflow", "--help"

  end
end
