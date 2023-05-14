class PactRubyStandalone124 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.2.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.4/pact-1.2.4-osx.tar.gz"
      sha256 "ff589807c15cd69806a64182bdd815d3c95af7895a34be67f221c28af5f39daf"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.4/pact-1.2.4-osx.tar.gz"
      sha256 "ff589807c15cd69806a64182bdd815d3c95af7895a34be67f221c28af5f39daf"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.4/pact-1.2.4-linux-x86_64.tar.gz"
        sha256 "0d80d68353ade5b4cb56fef18c5fc6511cdae5b81cb6936540e1bafab87860bd"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.4/pact-1.2.4-linux-x86.tar.gz"
        sha256 "7417461e9dd8339a4ed2b5037ec384a3b2f965184001fd2cf954b0a0477f67cd"
      end
    end
  end

  def install
    # pact-ruby-standalone
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    puts "# (see https://github.com/pact-foundation/pact-ruby-standalone/releases/)'"
    puts "# Run 'pact-broker --help'"
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
  end

  test do
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
