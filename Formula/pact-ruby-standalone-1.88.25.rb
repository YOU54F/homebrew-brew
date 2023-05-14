class PactRubyStandalone18825 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.25"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.25/pact-1.88.25-osx.tar.gz"
      sha256 "6adf31ad1157beb31dbd9a1e0407bec56175266be661e5992a1778183cf96ab2"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.25/pact-1.88.25-osx.tar.gz"
      sha256 "6adf31ad1157beb31dbd9a1e0407bec56175266be661e5992a1778183cf96ab2"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.25/pact-1.88.25-linux-x86_64.tar.gz"
        sha256 "32f5c91290333c999d123fd9d380569f4cc70ef08c83d97ad6b5cff3781224c9"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.25/pact-1.88.25-linux-x86.tar.gz"
        sha256 "52d9160f808a484de19ce9fc5fb26fd5d390fca3af90289d32012d8e0799900a"
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
