class PactRubyStandalone1450 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.45.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.45.0/pact-1.45.0-osx.tar.gz"
      sha256 "86c30c4dfcea1dc87a19abbc7ec836604ba4a70df00440a28e1f896851512034"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.45.0/pact-1.45.0-osx.tar.gz"
      sha256 "86c30c4dfcea1dc87a19abbc7ec836604ba4a70df00440a28e1f896851512034"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.45.0/pact-1.45.0-linux-x86_64.tar.gz"
        sha256 "516a3520819f6675bb9a9a5aaf3b442d3039bfb29b4707211bef2f2bc746ce7f"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.45.0/pact-1.45.0-linux-x86.tar.gz"
        sha256 "2c27d63da48dc867d7cadad4bc6f8184baa2f03d6beffbd5ac211d887cc87935"
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
    puts "# Run 'plugin-cli --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
    puts "# Run 'pactflow --help'"
  end

  test do
    system "#{bin}/pact", "help"
    system "#{bin}/pact-broker", "help"
    system "#{bin}/pact-message", "help"
    system "#{bin}/pact-mock-service", "help"
    system "#{bin}/pact-plugin-cli", "help"
    system "#{bin}/pact-provider-verifier", "help"
    system "#{bin}/pact-stub-service", "help"
    system "#{bin}/pactflow", "help"

  end
end
