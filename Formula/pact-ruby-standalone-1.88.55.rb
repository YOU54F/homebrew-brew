class PactRubyStandalone18855 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.55"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.55/pact-1.88.55-osx.tar.gz"
      sha256 "05ac45593551d64da710c8bb2b225620f8ef7ba21be570923666a0c802185125"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.55/pact-1.88.55-osx.tar.gz"
      sha256 "05ac45593551d64da710c8bb2b225620f8ef7ba21be570923666a0c802185125"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.55/pact-1.88.55-linux-x86_64.tar.gz"
        sha256 "e105d19a0c1cee4186c74f6fff419582ce61bc168f7a45ec53e932af6b95ff5f"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.55/pact-1.88.55-linux-x86.tar.gz"
        sha256 "07735237de8e7624000a16add5467ba60aece8f2a951eec21d9448fa85d08aea"
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
