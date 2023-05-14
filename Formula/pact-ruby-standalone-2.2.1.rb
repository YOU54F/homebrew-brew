class PactRubyStandalone221 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby 3.1.2 / WEBrick 1.6.1"
  homepage "https://github.com/you54f/pact-ruby-standalone"
  version "2.2.1"
  
  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.1/pact-2.2.1-osx-arm64.tar.gz"
      sha256 "0e165f4e8906887c69f1122c537192a83422d63103b3df3693c3dfd116a77c28"
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.1/pact-2.2.1-osx-x86_64.tar.gz"
      sha256 "483f56fa731cd58f0bbe52031cf1631a3e61296ee109b7c970387d5a5c8eacbf"
    end
  end
  
  on_linux do
    on_arm && Hardware::CPU.is_64_bit? do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.1/pact-2.2.1-linux-arm64.tar.gz"
      sha256 "481c4edc3a8c5e53f9d69026cb46988b7904185db3e0762fcffe470991d89c79"
    end
    on_intel && Hardware::CPU.is_64_bit? do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v2.2.1/pact-2.2.1-linux-x86_64.tar.gz"
      sha256 "c00e2d25e69c73dd525d53a0b6054cc19fae90f024b14689af6d42eb6aa373dd"
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
