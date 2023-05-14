class PactRubyStandalone1872 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.87.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.2/pact-1.87.2-osx.tar.gz"
      sha256 "61aca6b81b1ca658f2371b36d7aea75cb3fd7943a5f94c1db0eb6f18ffdc2eb9"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.2/pact-1.87.2-osx.tar.gz"
      sha256 "61aca6b81b1ca658f2371b36d7aea75cb3fd7943a5f94c1db0eb6f18ffdc2eb9"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.2/pact-1.87.2-linux-x86_64.tar.gz"
        sha256 "768f883d9a38bfd716e12676c904775f079478bb3cf22b5e3287175f7b60be35"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.2/pact-1.87.2-linux-x86.tar.gz"
        sha256 "efd26c475d7aefb442b07a0ab5703c9c88317776509d5ff6b3a128b3440dc47b"
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
