class PactRubyStandalone1170 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.17.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.17.0/pact-1.17.0-osx.tar.gz"
      sha256 "42794c8bd2a541c25f8deb2411d099d8d04d56bf0440680a2159541225b387c9"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.17.0/pact-1.17.0-osx.tar.gz"
      sha256 "42794c8bd2a541c25f8deb2411d099d8d04d56bf0440680a2159541225b387c9"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.17.0/pact-1.17.0-linux-x86_64.tar.gz"
        sha256 "bb8db6649bd39905728683771cb779f3453a979cc93874d53e06576a017e599e"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.17.0/pact-1.17.0-linux-x86.tar.gz"
        sha256 "92ebab58060f6a75a2152a1e0d75c324becf7ba2e8d83dcb56df3006c4cac7df"
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
