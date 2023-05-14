class PactRubyStandalone18865 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.65"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.65/pact-1.88.65-osx.tar.gz"
      sha256 "0017f4efc8c0cbc9d89da09254d3f3ab8177747f3351a040f508958f1b120d40"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.65/pact-1.88.65-osx.tar.gz"
      sha256 "0017f4efc8c0cbc9d89da09254d3f3ab8177747f3351a040f508958f1b120d40"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.65/pact-1.88.65-linux-x86_64.tar.gz"
        sha256 "a8fe762077ca663fd278c8214d3aaa6371198f3cafa7c3c55e81bc9ad9efe975"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.65/pact-1.88.65-linux-x86.tar.gz"
        sha256 "f5b2946312a4fad1aa7b3710557f9ea032867a7c63f99b255e26add870a30b91"
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
