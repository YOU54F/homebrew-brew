class PactRubyStandalone18842 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.42"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.42/pact-1.88.42-osx.tar.gz"
      sha256 "0b02f5ba529f5082151fbdd3b621f74814f1eaf13b99c9e4872a6d209e329f01"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.42/pact-1.88.42-osx.tar.gz"
      sha256 "0b02f5ba529f5082151fbdd3b621f74814f1eaf13b99c9e4872a6d209e329f01"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.42/pact-1.88.42-linux-x86_64.tar.gz"
        sha256 "943c84c125815c0d12761a4239c8b6350a34791375639b1e069060b06bf80e1b"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.42/pact-1.88.42-linux-x86.tar.gz"
        sha256 "9456e6b9e98ff35a3feab7d87691c2760dd968cfb91c3b379232a8aec635cb01"
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
