class PactRubyStandalone1600 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.60.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.60.0/pact-1.60.0-osx.tar.gz"
      sha256 "4016e06ac3b4a75d8cf4ad8e2acee13ed71c14c2dbab0cfa1827ea1627884710"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.60.0/pact-1.60.0-osx.tar.gz"
      sha256 "4016e06ac3b4a75d8cf4ad8e2acee13ed71c14c2dbab0cfa1827ea1627884710"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.60.0/pact-1.60.0-linux-x86_64.tar.gz"
        sha256 "f5de33827b63b8f6433c13dafd1e492d223d6cafe7fe38e567141f8e380985a7"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.60.0/pact-1.60.0-linux-x86.tar.gz"
        sha256 "77a2819a814b506ddabe48f5263c2f6d63558f84dd2bd6166bfe9776e964753e"
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
