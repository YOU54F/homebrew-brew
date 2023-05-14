class PactRubyStandalone1301 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.30.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.1/pact-1.30.1-osx.tar.gz"
      sha256 "92ec5ee0c4f274858aba10d49c4bcc5877145729000dec53178344c7a5da7d69"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.1/pact-1.30.1-osx.tar.gz"
      sha256 "92ec5ee0c4f274858aba10d49c4bcc5877145729000dec53178344c7a5da7d69"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.1/pact-1.30.1-linux-x86_64.tar.gz"
        sha256 "c5f82286751708e07642e13203bad2c91914999dbd168676cdbe72d5028ad1cc"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.1/pact-1.30.1-linux-x86.tar.gz"
        sha256 "69e08c8cbcc7e8767805b71f1ecb7b7b23629bb0ec96cf7ecd11afe9e663d140"
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
