class PactRubyStandalone143 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.4.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.3/pact-1.4.3-osx.tar.gz"
      sha256 "b43e030a12bd8fbd32f234ee0883987b73493adcd4688fef24e4845f34338b00"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.3/pact-1.4.3-osx.tar.gz"
      sha256 "b43e030a12bd8fbd32f234ee0883987b73493adcd4688fef24e4845f34338b00"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.3/pact-1.4.3-linux-x86_64.tar.gz"
        sha256 "d7bbf1f5ce7cc0f1f38ee88ce09dc969b4fd33eef05bc93d147e6ba900d99fda"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.3/pact-1.4.3-linux-x86.tar.gz"
        sha256 "ac9c53c522cdca624e9987021394e7f25ac8fa35bad2c5606bf1c13c0253eeb6"
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
