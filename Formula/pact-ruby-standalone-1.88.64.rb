class PactRubyStandalone18864 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.64"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.64/pact-1.88.64-osx.tar.gz"
      sha256 "105e63ade925270fe42ae44c5a81c60e2f194706b6ce6b55bc991437d3c4a698"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.64/pact-1.88.64-osx.tar.gz"
      sha256 "105e63ade925270fe42ae44c5a81c60e2f194706b6ce6b55bc991437d3c4a698"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.64/pact-1.88.64-linux-x86_64.tar.gz"
        sha256 "5400eb5cbb38a634929e220205eb29b124f055abf0c61e2766746c02b0a80610"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.64/pact-1.88.64-linux-x86.tar.gz"
        sha256 "7821829b9c40ba983b8b35a5b7ff654a7b00f49080bfcf9e5e4a6658bd6a3f9f"
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
