class PactRubyStandalone220 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby 3.1.2 / WEBrick 1.6.1"
  homepage "https://github.com/you54f/pact-ruby-standalone"
  version "2.2.0"
  
  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.0/pact-2.2.0-osx-arm64.tar.gz"
      sha256 "4442a76251b67481e11671df0bb70e1a4607a1711e154f3b9f894b98b04ee282"
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.0/pact-2.2.0-osx-x86_64.tar.gz"
      sha256 "676a7b94387cfbcad81d78a2fbeb6c1b26c5cb81517940079063561d651e36a0"
    end
  end
  
  on_linux do
    on_arm && Hardware::CPU.is_64_bit? do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.0/pact-2.2.0-linux-arm64.tar.gz"
      sha256 "d597035ca8a6cb736f51b3344af7662d518210da1fc902d509851ca3e2d18575"
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.0/pact-2.2.0-linux-x86_64.tar.gz"
      sha256 "d2c4f9083cdbab6b55d88457c7525eebc1da672b544594c095c74e82af26ad93"
    end
  end

  def install
    # pact-ruby-standalone
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    puts "# (see https://github.com/you54f/pact-ruby-standalone/releases/)'"
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
    system "#{bin}/pact-plugin-cli", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
    system "#{bin}/pactflow", "--help"

  end
end
