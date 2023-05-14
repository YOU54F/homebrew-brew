class PactRubyStandalone1821 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.82.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.1/pact-1.82.1-osx.tar.gz"
      sha256 "7d4ed8d5b738aceed067b22430de3962e1725921ef6626dfcbcf322106f48c41"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.1/pact-1.82.1-osx.tar.gz"
      sha256 "7d4ed8d5b738aceed067b22430de3962e1725921ef6626dfcbcf322106f48c41"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.1/pact-1.82.1-linux-x86_64.tar.gz"
        sha256 "99c3877a2116b7351aa93c7b7969e5b76c8989a506faa1fcbacbcd0766d842c3"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.82.1/pact-1.82.1-linux-x86.tar.gz"
        sha256 "ed1544a2b599608098ecbd04006f4614a968a8b0d95b37b1dc7d605dc87b3e63"
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
