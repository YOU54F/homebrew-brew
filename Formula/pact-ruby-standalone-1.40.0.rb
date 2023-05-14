class PactRubyStandalone1400 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.40.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.40.0/pact-1.40.0-osx.tar.gz"
      sha256 "5d09ee9bee6a16317b3e9600b6f5c635cdbdaef91b0920d792de01abce4d5278"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.40.0/pact-1.40.0-osx.tar.gz"
      sha256 "5d09ee9bee6a16317b3e9600b6f5c635cdbdaef91b0920d792de01abce4d5278"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.40.0/pact-1.40.0-linux-x86_64.tar.gz"
        sha256 "71fb0bc4897d9907923021b656c346e92c04fa1f6e335d3b8f7fbc198ff903bc"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.40.0/pact-1.40.0-linux-x86.tar.gz"
        sha256 "a35feaec2349510d4a2ce89b3e7e9bf75391a0020b754bd21a25101f4f159f7a"
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
