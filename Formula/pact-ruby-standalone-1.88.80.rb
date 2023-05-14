class PactRubyStandalone18880 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.80"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.80/pact-1.88.80-osx.tar.gz"
      sha256 "cf671f8adda527c7a663918e26e70ad98d5367fc204550cb70f50f604f1f1e5e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.80/pact-1.88.80-osx.tar.gz"
      sha256 "cf671f8adda527c7a663918e26e70ad98d5367fc204550cb70f50f604f1f1e5e"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.80/pact-1.88.80-linux-x86_64.tar.gz"
        sha256 "7a19e9b20970d2b83fac2a2049a74adba50158b0dad24d04d8ad38cf68b1a95c"
      end
    end
    if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.80/pact-1.88.80-linux-x86.tar.gz"
        sha256 "5101eff2f821fc8f0b7e1190af18bd766a8bcc2e06f39ea2dc1e523275cac418"
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
