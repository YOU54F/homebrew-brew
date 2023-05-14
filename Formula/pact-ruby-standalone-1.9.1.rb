class PactRubyStandalone191 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.9.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.9.1/pact-1.9.1-osx.tar.gz"
      sha256 "9ed26e52434bb8416d50c4598fa7000e90514400d6a6631f7448e7a9adc7b5c3"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.9.1/pact-1.9.1-osx.tar.gz"
      sha256 "9ed26e52434bb8416d50c4598fa7000e90514400d6a6631f7448e7a9adc7b5c3"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.9.1/pact-1.9.1-linux-x86_64.tar.gz"
        sha256 "8f8549991559971eca40386a57012f8ff7d54b8f964b0760acce60f1e5c972c9"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.9.1/pact-1.9.1-linux-x86.tar.gz"
        sha256 "e9452ae2901bb6351c73997d1d0b103693174c4d7c02b0a2c21edfe11db65b01"
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
