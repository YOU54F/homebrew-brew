class PactRubyStandalone1300 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.30.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.0/pact-1.30.0-osx.tar.gz"
      sha256 "0cc71c4a51294115b7ccdc288d2bd37e137d47069c7d79fc196bac6b9f933285"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.0/pact-1.30.0-osx.tar.gz"
      sha256 "0cc71c4a51294115b7ccdc288d2bd37e137d47069c7d79fc196bac6b9f933285"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.0/pact-1.30.0-linux-x86_64.tar.gz"
        sha256 "53d1f4854ababac9996cb3d947b77ea147d39bd513fd7698d1d61768f85d9e49"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.30.0/pact-1.30.0-linux-x86.tar.gz"
        sha256 "0d3ca9ac4c43917e4a78201b975b7f38008ab8aade7f3bfe9d23d561cc7fc277"
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
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
