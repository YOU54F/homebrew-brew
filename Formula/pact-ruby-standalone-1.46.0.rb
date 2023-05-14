class PactRubyStandalone1460 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.46.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.46.0/pact-1.46.0-osx.tar.gz"
      sha256 "dad42c29b7a1fbd618ab64bb4825cbd546d43f9606329f44274077f83c836b94"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.46.0/pact-1.46.0-osx.tar.gz"
      sha256 "dad42c29b7a1fbd618ab64bb4825cbd546d43f9606329f44274077f83c836b94"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.46.0/pact-1.46.0-linux-x86_64.tar.gz"
        sha256 "844f5f0eaa76eaeb74852c7dd670024fa2eff6b88f7196876a53441076408dc3"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.46.0/pact-1.46.0-linux-x86.tar.gz"
        sha256 "2d718ad67a70b1abb28817001108527a6849b7af2c30de6b9dd2b9e7b87988b5"
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
