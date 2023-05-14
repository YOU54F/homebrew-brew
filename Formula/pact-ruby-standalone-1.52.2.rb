class PactRubyStandalone1522 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.52.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.2/pact-1.52.2-osx.tar.gz"
      sha256 "c3efaf090359bf6ea78b1b45eba4c88b48e65036c14cd5811a3b5e5f7bf89092"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.2/pact-1.52.2-osx.tar.gz"
      sha256 "c3efaf090359bf6ea78b1b45eba4c88b48e65036c14cd5811a3b5e5f7bf89092"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.2/pact-1.52.2-linux-x86_64.tar.gz"
        sha256 "a719d5211fa225959a15d3acbe92ec206730d8ee70c0504c86a54ff7cc2c387c"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.2/pact-1.52.2-linux-x86.tar.gz"
        sha256 "ba4d8cfdad638895cb636b61c90d882704439025eb33aa021073b573515a7ea8"
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
