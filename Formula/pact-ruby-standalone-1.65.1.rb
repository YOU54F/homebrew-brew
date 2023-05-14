class PactRubyStandalone1651 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.65.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.65.1/pact-1.65.1-osx.tar.gz"
      sha256 "ffdd7d6fbe015f0ea3b73cbf0540c4a0ac81eb53cc04190b95ff4e525731e6ea"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.65.1/pact-1.65.1-osx.tar.gz"
      sha256 "ffdd7d6fbe015f0ea3b73cbf0540c4a0ac81eb53cc04190b95ff4e525731e6ea"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.65.1/pact-1.65.1-linux-x86_64.tar.gz"
        sha256 "39f2ff8561287775b990d547cc4d15a1eca16e22355cb9319f034464156d2579"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.65.1/pact-1.65.1-linux-x86.tar.gz"
        sha256 "13ffe1ecf7743c52df7c8b86f3aa402f3605d194480cf3ab391455c50cf40883"
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
