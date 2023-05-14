class PactRubyStandalone18832 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.32"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.32/pact-1.88.32-osx.tar.gz"
      sha256 "ee5407660222e327350b29e4f10fb872c45271391b50921607a23db233ecaf0c"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.32/pact-1.88.32-osx.tar.gz"
      sha256 "ee5407660222e327350b29e4f10fb872c45271391b50921607a23db233ecaf0c"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel && Hardware::CPU.is_64_bit? do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.32/pact-1.88.32-linux-x86_64.tar.gz"
        sha256 "a34afbe20070c0747022e5a61b85e9085c96fa7aedb212fd74aa2470cbbbafc8"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel && !Hardware::CPU.is_64_bit? do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.32/pact-1.88.32-linux-x86.tar.gz"
        sha256 "75bd9c4fa6cc1f5a2ce616a953ffac75ce4f3260d36b077ad6d7753d3b7dd720"
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
    system "#{bin}/pact", "help"
    system "#{bin}/pact-broker", "help"
    system "#{bin}/pact-message", "help"
    system "#{bin}/pact-mock-service", "help"
    system "#{bin}/pact-plugin-cli", "help"
    system "#{bin}/pact-provider-verifier", "help"
    system "#{bin}/pact-stub-service", "help"
    system "#{bin}/pactflow", "help"

  end
end
