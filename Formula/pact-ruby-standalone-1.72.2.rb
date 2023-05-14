class PactRubyStandalone1722 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.72.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.72.2/pact-1.72.2-osx.tar.gz"
      sha256 "7a18613aec5729321bb8a401ff97780e7bc75467e7b4bfe50a48dac1583f13e0"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.72.2/pact-1.72.2-osx.tar.gz"
      sha256 "7a18613aec5729321bb8a401ff97780e7bc75467e7b4bfe50a48dac1583f13e0"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.72.2/pact-1.72.2-linux-x86_64.tar.gz"
        sha256 "a9426cbde3327f3ce9a7c858e6b56bd882243f338aa583f10461dfadf7cfedbb"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.72.2/pact-1.72.2-linux-x86.tar.gz"
        sha256 "f6cf3a706ca88515f5c41382372d6c942854ecceb57ee5c902d9406e410340ef"
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
