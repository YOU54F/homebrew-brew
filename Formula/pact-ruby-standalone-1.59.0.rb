class PactRubyStandalone1590 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.59.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.59.0/pact-1.59.0-osx.tar.gz"
      sha256 "6043f34b9f94be13e32c2d5974a1c44a7135d289130a08a0e52d3b3d9a9b8c8e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.59.0/pact-1.59.0-osx.tar.gz"
      sha256 "6043f34b9f94be13e32c2d5974a1c44a7135d289130a08a0e52d3b3d9a9b8c8e"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.59.0/pact-1.59.0-linux-x86_64.tar.gz"
        sha256 "271b4e6f3f5f09f12caa0071eb0d407cbd74ea8410c674f0ec48dbaca52394b6"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.59.0/pact-1.59.0-linux-x86.tar.gz"
        sha256 "20274551c4e47691c3590fe9b9ae37e2c29b9c1cae1710cd2d6527b4db396ca8"
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
    puts "# Run 'pactflow --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
    system "#{bin}/pactflow", "--help"

  end
end
