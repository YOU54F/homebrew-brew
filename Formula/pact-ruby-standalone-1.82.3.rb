class PactRubyStandalone1823 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.82.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.3/pact-1.82.3-osx.tar.gz"
      sha256 "e4d6cc7a303d64e2f501b696e123ffc55707e11c4ae3c2ddd49fa8fb79b14741"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.3/pact-1.82.3-osx.tar.gz"
      sha256 "e4d6cc7a303d64e2f501b696e123ffc55707e11c4ae3c2ddd49fa8fb79b14741"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.3/pact-1.82.3-linux-x86_64.tar.gz"
        sha256 "f141ab6e4b788e583bef6938619866ae1f2bb05430258d34d6343f6ee65e8eab"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.3/pact-1.82.3-linux-x86.tar.gz"
        sha256 "e0c43a40a7fa13c4ce8a779f1505ab3bdd57bb38478cfc469ae343f69aa4e017"
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
