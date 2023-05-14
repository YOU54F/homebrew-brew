class PactRubyStandalone150 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.5.0/pact-1.5.0-osx.tar.gz"
      sha256 "d8dfb9aaff316e49c03b4a93f049c26acece315ea12e90675d9ee6c072be13bf"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.5.0/pact-1.5.0-osx.tar.gz"
      sha256 "d8dfb9aaff316e49c03b4a93f049c26acece315ea12e90675d9ee6c072be13bf"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.5.0/pact-1.5.0-linux-x86_64.tar.gz"
        sha256 "88751202424c4fec31d745dbec2f81e73e6a6dc4d02a6c9efeeec39308b94be5"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.5.0/pact-1.5.0-linux-x86.tar.gz"
        sha256 "e9467d5f1b26741710640f71e9b09da686df9a7bb7288cc69d3adc6f798040f0"
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
