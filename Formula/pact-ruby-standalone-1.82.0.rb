class PactRubyStandalone1820 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.82.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.0/pact-1.82.0-osx.tar.gz"
      sha256 "2cef4890e64c7c1e7c454dc3c81abeaf936b58f957ecc16cad0a7518b87ecaef"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.0/pact-1.82.0-osx.tar.gz"
      sha256 "2cef4890e64c7c1e7c454dc3c81abeaf936b58f957ecc16cad0a7518b87ecaef"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.0/pact-1.82.0-linux-x86_64.tar.gz"
        sha256 "d66162c3912fddb01d6f43ccd19caf25f3702544ec470b809a8e8ea0a5fe2dd6"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.0/pact-1.82.0-linux-x86.tar.gz"
        sha256 "f1e5042c1ee57f0d5e86fa12ee9e77e4674702d49b4fd8263bdd42160aa71ec7"
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
