class PactRubyStandalone1180 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.18.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.18.0/pact-1.18.0-osx.tar.gz"
      sha256 "1cd9ebb922ef8bfcffa383af3d6b1fe02b942bd3f94fdde1ab4d2c972c6f414a"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.18.0/pact-1.18.0-osx.tar.gz"
      sha256 "1cd9ebb922ef8bfcffa383af3d6b1fe02b942bd3f94fdde1ab4d2c972c6f414a"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.18.0/pact-1.18.0-linux-x86_64.tar.gz"
        sha256 "1dc8cf1fc9267b8ddec316da974ef14a63df3ac7b9fdc5bbbf3808a3bae2d3f7"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.18.0/pact-1.18.0-linux-x86.tar.gz"
        sha256 "fd67f80949f8ae77097d3a8a590eb23f482b6c0a0ebe7c2210ac77e54b178446"
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
    puts "# Run 'pactflow --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
    system "#{bin}/pactflow", "--help"

  end
end
