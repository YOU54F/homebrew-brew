class PactRubyStandalone1441 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.44.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.44.1/pact-1.44.1-osx.tar.gz"
      sha256 "6ab3b6ea15800b855d6c5a49b0b74548b9fb35323ca47bc82c49ecb975ae606f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.44.1/pact-1.44.1-osx.tar.gz"
      sha256 "6ab3b6ea15800b855d6c5a49b0b74548b9fb35323ca47bc82c49ecb975ae606f"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.44.1/pact-1.44.1-linux-x86_64.tar.gz"
        sha256 "6443beefaf8d9bb8ecfb757310ac2c77d7651fe515a6f00ae56f333c142a88a1"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.44.1/pact-1.44.1-linux-x86.tar.gz"
        sha256 "4a2803f07499a205a44b537028a23b5ce846ca0fd869218c7c4d071553bdb72c"
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
