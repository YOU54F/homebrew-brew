class PactRubyStandalone18877 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.77"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.77/pact-1.88.77-osx.tar.gz"
      sha256 "231519de60d24b2be169cb3dd654bd3cb0006df4d7047654dab478dbe4a6fa89"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.77/pact-1.88.77-osx.tar.gz"
      sha256 "231519de60d24b2be169cb3dd654bd3cb0006df4d7047654dab478dbe4a6fa89"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.77/pact-1.88.77-linux-x86_64.tar.gz"
        sha256 "f242f647655fb8da6f842de80a4e35967d5f9d7e9a2a26f56f409606ca00a598"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.77/pact-1.88.77-linux-x86.tar.gz"
        sha256 "eb5be11ec6b88af9cec7c3a9fbbcbf63be339631268e8a798a0d90bc87c78ff8"
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
