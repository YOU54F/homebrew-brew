class PactRubyStandalone18826 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.26"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.26/pact-1.88.26-osx.tar.gz"
      sha256 "7b3e33acec563d317946c579c71dd61447777326d7ec0cf66980f69fd5927f44"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.26/pact-1.88.26-osx.tar.gz"
      sha256 "7b3e33acec563d317946c579c71dd61447777326d7ec0cf66980f69fd5927f44"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.26/pact-1.88.26-linux-x86_64.tar.gz"
        sha256 "c912fe4eb61b637a885bc7caf81456c5a5a9583f269dfdc1675975025158a0ce"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.26/pact-1.88.26-linux-x86.tar.gz"
        sha256 "7d54cca748d3098abf23267735752ee287eae2ba476b8db0736fbb31f00cc260"
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
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-plugin-cli", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
    system "#{bin}/pactflow", "--help"

  end
end
