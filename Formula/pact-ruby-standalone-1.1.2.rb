class PactRubyStandalone112 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.1.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2/pact-1.1.2-osx.tar.gz"
      sha256 "283d3351d7e34bb71e04fd157d908310c481d26f9684f9886b4367fff20ddf34"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2/pact-1.1.2-osx.tar.gz"
      sha256 "283d3351d7e34bb71e04fd157d908310c481d26f9684f9886b4367fff20ddf34"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2/pact-1.1.2-linux-x86_64.tar.gz"
        sha256 "a58dd4816a1d31186181eea49fbc0e3ddc9dffbbce8d90038404900cd4750a90"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.1.2/pact-1.1.2-linux-x86.tar.gz"
        sha256 "190cf881b844abfc8b63360b3897641da963616e9067df9775d58f4e5ae279d9"
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
