class PactRubyStandalone18822 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.22"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.22/pact-1.88.22-osx.tar.gz"
      sha256 "dc1658c0a4931e2e50109ef04654e1f3639995292b8d9e2172b59f225545cf0e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.22/pact-1.88.22-osx.tar.gz"
      sha256 "dc1658c0a4931e2e50109ef04654e1f3639995292b8d9e2172b59f225545cf0e"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel && Hardware::CPU.is_64_bit? do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.22/pact-1.88.22-linux-x86_64.tar.gz"
        sha256 "33171f856b338c494d588a60068a08b56b8d07d55947353eeadd7b7f91d50da3"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel && !Hardware::CPU.is_64_bit? do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.22/pact-1.88.22-linux-x86.tar.gz"
        sha256 "5fb30405bc64c28d7c3f97398e5d237280172338f39e0bcdf6d4de28bbba9869"
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
