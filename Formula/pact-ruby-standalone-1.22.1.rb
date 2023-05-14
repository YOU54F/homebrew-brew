class PactRubyStandalone1221 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.22.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.22.1/pact-1.22.1-osx.tar.gz"
      sha256 "e00123ab853ddbd08eb745e629cb5417194ef9c8a800635aea69aff557d5fe98"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.22.1/pact-1.22.1-osx.tar.gz"
      sha256 "e00123ab853ddbd08eb745e629cb5417194ef9c8a800635aea69aff557d5fe98"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.22.1/pact-1.22.1-linux-x86_64.tar.gz"
        sha256 "fa27942e402e1df8ca6872dbb15059b59431e9106292826abccc10d2b6e826f5"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.22.1/pact-1.22.1-linux-x86.tar.gz"
        sha256 "417caae8667c9f623c4e6fcf2fcdccad4dbcc772f244ea79db9a56eec0b2cd6f"
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
