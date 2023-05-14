class PactRubyStandalone125 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.2.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.5/pact-1.2.5-osx.tar.gz"
      sha256 "34980b0f3193aabe53116ea8119f57051eba1c4290524024a1f5f191cf9b7534"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.5/pact-1.2.5-osx.tar.gz"
      sha256 "34980b0f3193aabe53116ea8119f57051eba1c4290524024a1f5f191cf9b7534"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.5/pact-1.2.5-linux-x86_64.tar.gz"
        sha256 "668d8496bdfcbb996a64844697ada1ca8aec3713fd2003529b5b916ff8737663"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.5/pact-1.2.5-linux-x86.tar.gz"
        sha256 "8f60a523a527e68b49ab043f926bbb55038c184cb7608d3239ab68d4ca7d3f2e"
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
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
