class PactRubyStandalone1473 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.47.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.3/pact-1.47.3-osx.tar.gz"
      sha256 "5d0d798bc09fda12517da4d5ec25b2a4891b6827aab06bcf6ba7e957fb309e99"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.3/pact-1.47.3-osx.tar.gz"
      sha256 "5d0d798bc09fda12517da4d5ec25b2a4891b6827aab06bcf6ba7e957fb309e99"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.3/pact-1.47.3-linux-x86_64.tar.gz"
        sha256 "775080076ec0238fc61ade47b4be615522485d9a60bcb7402f72dd4be9faa564"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.3/pact-1.47.3-linux-x86.tar.gz"
        sha256 "7cb23ffa49fc5f9eddd88f20bd8d580668bea21753ba3c82b69df19275ed96b2"
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
