class PactRubyStandalone18873 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.73"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.73/pact-1.88.73-osx.tar.gz"
      sha256 "689b2bda9ee42b792fe5861af24e9b57b98d88ae5024b2b390b8ef5265fce108"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.73/pact-1.88.73-osx.tar.gz"
      sha256 "689b2bda9ee42b792fe5861af24e9b57b98d88ae5024b2b390b8ef5265fce108"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.73/pact-1.88.73-linux-x86_64.tar.gz"
        sha256 "7836f3f813805aea6d403c25e50d4ad3eef36585a2189734dc5315329ec7e646"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.73/pact-1.88.73-linux-x86.tar.gz"
        sha256 "b55ca976378a7287be0ceb1d3a432dd84500017462bcf02913d6a62b716f0f9c"
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
