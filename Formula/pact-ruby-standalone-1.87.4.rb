class PactRubyStandalone1874 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.87.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.4/pact-1.87.4-osx.tar.gz"
      sha256 "a766fcccc25459584b0f110270d4194193aa61e462f8bcb9a2634357117733c9"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.4/pact-1.87.4-osx.tar.gz"
      sha256 "a766fcccc25459584b0f110270d4194193aa61e462f8bcb9a2634357117733c9"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.4/pact-1.87.4-linux-x86_64.tar.gz"
        sha256 "44ad720fb40f93dcac586ad87503d27c46930215523e3ce9723b699f83385b97"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.87.4/pact-1.87.4-linux-x86.tar.gz"
        sha256 "328c4f40501e8e022b6f3b6b0a7da7acf9e0b2dea0d3066c7b250de6b7bd758a"
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
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-plugin-cli", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
    system "#{bin}/pactflow", "--help"

  end
end
