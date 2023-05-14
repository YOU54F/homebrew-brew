class PactRubyStandalone1120 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.12.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.12.0/pact-1.12.0-osx.tar.gz"
      sha256 "15ee2db0792f74d26a4c3ff7b0aa688784664353a490e585cc8177f8a775dec3"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.12.0/pact-1.12.0-osx.tar.gz"
      sha256 "15ee2db0792f74d26a4c3ff7b0aa688784664353a490e585cc8177f8a775dec3"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.12.0/pact-1.12.0-linux-x86_64.tar.gz"
        sha256 "84d743bb45dbabc22f7833e347e76d639c4a4272c5587e47d1292e5702b25c16"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.12.0/pact-1.12.0-linux-x86.tar.gz"
        sha256 "d37f6b19be63f1cb3892d566511b8dc8a0b13cf668620040b102819c0850c614"
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
