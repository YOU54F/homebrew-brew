class PactRubyStandalone1544 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.54.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.54.4/pact-1.54.4-osx.tar.gz"
      sha256 "a8a95e4a0d44b49b7a8a6aa7d21631a53496ef4f4c49918e3d489498f4fac8ea"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.54.4/pact-1.54.4-osx.tar.gz"
      sha256 "a8a95e4a0d44b49b7a8a6aa7d21631a53496ef4f4c49918e3d489498f4fac8ea"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.54.4/pact-1.54.4-linux-x86_64.tar.gz"
        sha256 "8b63800720ac0003368193c1607c5092b55d5d5c4d3311a79d9d8b5367c11c9a"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.54.4/pact-1.54.4-linux-x86.tar.gz"
        sha256 "2ec216f072f17b69eb7593a60c4cbf344188393cbaf7945b2e60d8e37e85bfcd"
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
