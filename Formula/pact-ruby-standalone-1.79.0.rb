class PactRubyStandalone1790 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.79.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.79.0/pact-1.79.0-osx.tar.gz"
      sha256 "fd8d98ada9ccb8cb9f84fdf50ae3b6a57381d635dfd95474164e1211668fa4f8"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.79.0/pact-1.79.0-osx.tar.gz"
      sha256 "fd8d98ada9ccb8cb9f84fdf50ae3b6a57381d635dfd95474164e1211668fa4f8"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.79.0/pact-1.79.0-linux-x86_64.tar.gz"
        sha256 "e1f9728aede81fa7910bd7139d6037ae61e6906e1d13bdccf62f19cd53952712"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.79.0/pact-1.79.0-linux-x86.tar.gz"
        sha256 "54c76b3dd052186b30edfcb0ea12cd1a3575394d35914c5de24c0cdf8dcf3089"
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
