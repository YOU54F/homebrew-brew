class PactRubyStandalone1620 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.62.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.62.0/pact-1.62.0-osx.tar.gz"
      sha256 "84139bf77811f27de9b19e0a29fdbe08c8fc3c7ec521bb3ac87e742bd35fcdce"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.62.0/pact-1.62.0-osx.tar.gz"
      sha256 "84139bf77811f27de9b19e0a29fdbe08c8fc3c7ec521bb3ac87e742bd35fcdce"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.62.0/pact-1.62.0-linux-x86_64.tar.gz"
        sha256 "05e692de86d0036968311673d2d7eacf40437b06df2eafe7520889d896ef246f"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.62.0/pact-1.62.0-linux-x86.tar.gz"
        sha256 "129ba09ffbc7fb75173ac119c76a06660419ec035d065b68a80355056ba4dca2"
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
