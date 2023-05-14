class PactRubyStandalone110 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.0/pact-1.1.0-osx.tar.gz"
      sha256 "b7a6941f754a1cda4f297ab56a09e3a028e9179c984db6f79e22f37f433c6f61"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.0/pact-1.1.0-osx.tar.gz"
      sha256 "b7a6941f754a1cda4f297ab56a09e3a028e9179c984db6f79e22f37f433c6f61"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.0/pact-1.1.0-linux-x86_64.tar.gz"
        sha256 "142f019e00a972fc3225ca527cca3e996875742497e97533d46b64b5333e58cf"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.0/pact-1.1.0-linux-x86.tar.gz"
        sha256 "277c8af04e08b6ab17c6e20a90ac4f407106adf572ee83338612b41bed69b483"
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
