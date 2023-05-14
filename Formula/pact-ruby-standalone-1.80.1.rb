class PactRubyStandalone1801 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.80.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.80.1/pact-1.80.1-osx.tar.gz"
      sha256 "9dd196d4b99b439020e613a30969096efb171bfc1ee930af4eef50ff95a1490e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.80.1/pact-1.80.1-osx.tar.gz"
      sha256 "9dd196d4b99b439020e613a30969096efb171bfc1ee930af4eef50ff95a1490e"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.80.1/pact-1.80.1-linux-x86_64.tar.gz"
        sha256 "f23d2ab54a60e2c9f8a055580ed97de2f040b138e7cf8d6729f5148bf6beb149"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.80.1/pact-1.80.1-linux-x86.tar.gz"
        sha256 "410029001e9b2554e0778a981c582bea71b2e7aa452f4db6d1b0a8936b42d18c"
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
