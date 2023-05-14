class PactRubyStandalone18830 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.30"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.30/pact-1.88.30-osx.tar.gz"
      sha256 "75a7e870f467be44625b3b68fadff146b7b8f9626f211e963510a98cbf33bef2"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.30/pact-1.88.30-osx.tar.gz"
      sha256 "75a7e870f467be44625b3b68fadff146b7b8f9626f211e963510a98cbf33bef2"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.30/pact-1.88.30-linux-x86_64.tar.gz"
        sha256 "c795b74b5958e3a7d6584f06e96b887346247f188016cfd8fc0cf94c3c5cd5ef"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.30/pact-1.88.30-linux-x86.tar.gz"
        sha256 "e9fc8f3202ed16a3fb88f3f01644bd285866c5c11cf7611e2ae9099f1801095d"
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
