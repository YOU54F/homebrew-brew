class PactRubyStandalone144 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.4.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.4/pact-1.4.4-osx.tar.gz"
      sha256 "cc95bf7da8d5feb9fc1540f059522594f512cc6d83c500ac4c5c120d7fd4912f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.4/pact-1.4.4-osx.tar.gz"
      sha256 "cc95bf7da8d5feb9fc1540f059522594f512cc6d83c500ac4c5c120d7fd4912f"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.4/pact-1.4.4-linux-x86_64.tar.gz"
        sha256 "e3d657f8bc7e556191b2f7416001d4fc699f510bbde8405963e31e62395aa8c4"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.4.4/pact-1.4.4-linux-x86.tar.gz"
        sha256 "83994016a46d88b924c29cbb0aa4476b36d0281f31b997f04d835352a9914144"
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
