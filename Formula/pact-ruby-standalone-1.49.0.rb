class PactRubyStandalone1490 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.49.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.49.0/pact-1.49.0-osx.tar.gz"
      sha256 "e9e550aaa78c17ec40f609ae0cdc8fb4cd9b110f9d75635460609f3de852e8f3"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.49.0/pact-1.49.0-osx.tar.gz"
      sha256 "e9e550aaa78c17ec40f609ae0cdc8fb4cd9b110f9d75635460609f3de852e8f3"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.49.0/pact-1.49.0-linux-x86_64.tar.gz"
        sha256 "f1c579589c5e6d8fda3201dbb9c4f3f06e7ad4da8b8af73694c3bf68958b5df5"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.49.0/pact-1.49.0-linux-x86.tar.gz"
        sha256 "156df6592ecfedfe014c19a87c95554600aae4cae9887d4cbb20e760aae20ef3"
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
