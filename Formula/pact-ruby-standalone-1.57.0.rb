class PactRubyStandalone1570 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.57.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.57.0/pact-1.57.0-osx.tar.gz"
      sha256 "583b6b24fbd7e1d144b775e9586c2b1ae15cde222451b5f41069b15e1ddfa063"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.57.0/pact-1.57.0-osx.tar.gz"
      sha256 "583b6b24fbd7e1d144b775e9586c2b1ae15cde222451b5f41069b15e1ddfa063"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.57.0/pact-1.57.0-linux-x86_64.tar.gz"
        sha256 "5f677277cb603b6f0c8f54b72520d3a0fa6dbc1b1aead591a19892d8ca9128d7"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.57.0/pact-1.57.0-linux-x86.tar.gz"
        sha256 "f2548d2b8aaadfd52f4583b70440490415b7a83317eb40266143180699b3d139"
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
