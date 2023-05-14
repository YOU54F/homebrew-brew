class PactRubyStandalone1310 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.31.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.31.0/pact-1.31.0-osx.tar.gz"
      sha256 "d347bf9ee569525cea76df9563e5e032a27bf4d1fa449d5934f36cdc2e8e9785"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.31.0/pact-1.31.0-osx.tar.gz"
      sha256 "d347bf9ee569525cea76df9563e5e032a27bf4d1fa449d5934f36cdc2e8e9785"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.31.0/pact-1.31.0-linux-x86_64.tar.gz"
        sha256 "e767e391d4e17c318d7731b282a83797197a9a7d800aa97c32136d1c76a66d85"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.31.0/pact-1.31.0-linux-x86.tar.gz"
        sha256 "b06e8b18778b2b77c6e6ec3d6e125160bddf5a6f577d20b4d7a9466c174456d2"
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
    puts "# Run 'plugin-cli --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
    puts "# Run 'pactflow --help'"
  end

  test do
    system "#{bin}/pact", "help"
    system "#{bin}/pact-broker", "help"
    system "#{bin}/pact-message", "help"
    system "#{bin}/pact-mock-service", "help"
    system "#{bin}/pact-plugin-cli", "help"
    system "#{bin}/pact-provider-verifier", "help"
    system "#{bin}/pact-stub-service", "help"
    system "#{bin}/pactflow", "help"

  end
end
