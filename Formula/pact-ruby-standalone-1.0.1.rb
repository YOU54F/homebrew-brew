class PactRubyStandalone101 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.1/pact-1.0.1-osx.tar.gz"
      sha256 "a07b55f170bbbaae416f335d471beaadbc17a42f913c2e7eb742bebbe86a4f39"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.1/pact-1.0.1-osx.tar.gz"
      sha256 "a07b55f170bbbaae416f335d471beaadbc17a42f913c2e7eb742bebbe86a4f39"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.1/pact-1.0.1-linux-x86_64.tar.gz"
        sha256 "b6dd48363d230a93404af765bf338695ebbe43a8ed10a345fd4f0258b9a9049e"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.1/pact-1.0.1-linux-x86.tar.gz"
        sha256 "5f0f5f8819316005bac5a55f811b16de5500c4214e9503e65223f6cff0b28afd"
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
