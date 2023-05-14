class PactRubyStandalone171 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.7.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.1/pact-1.7.1-osx.tar.gz"
      sha256 "a5c8ae04b2fa1926bafdb0d49296cc0b48b34220c5e6f3f1f70b23f4cf1a5b85"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.1/pact-1.7.1-osx.tar.gz"
      sha256 "a5c8ae04b2fa1926bafdb0d49296cc0b48b34220c5e6f3f1f70b23f4cf1a5b85"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.1/pact-1.7.1-linux-x86_64.tar.gz"
        sha256 "5e0cb4d520febbc32ac72d88603365b565b12f69395f4525618f6f34be096496"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.1/pact-1.7.1-linux-x86.tar.gz"
        sha256 "d9e522a45ce63d4a3563f4b7091fd6caf363df44c9e42e4f54cf2a8773c84dba"
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
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
