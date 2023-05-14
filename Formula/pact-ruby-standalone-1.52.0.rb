class PactRubyStandalone1520 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.52.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.0/pact-1.52.0-osx.tar.gz"
      sha256 "24632d456e47dfe008f51baf739f9734298462aadec325b2398d7ae0bf9d38a9"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.0/pact-1.52.0-osx.tar.gz"
      sha256 "24632d456e47dfe008f51baf739f9734298462aadec325b2398d7ae0bf9d38a9"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.0/pact-1.52.0-linux-x86_64.tar.gz"
        sha256 "9af7612dcf8210b07e8c7bd2b05f772484b159671595872cccb66f57a044d741"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.52.0/pact-1.52.0-linux-x86.tar.gz"
        sha256 "1d840d8cbadc0351c274ee19e42b2ac39eb920c1c0c9214e66b875f4e64a3ee8"
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
