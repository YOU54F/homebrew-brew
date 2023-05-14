class PactRubyStandalone18850 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.50"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.50/pact-1.88.50-osx.tar.gz"
      sha256 "e2ddf9f33981ef47248e87aef55f1b05f505a4919cab5b179e190506157c7c7b"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.50/pact-1.88.50-osx.tar.gz"
      sha256 "e2ddf9f33981ef47248e87aef55f1b05f505a4919cab5b179e190506157c7c7b"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.50/pact-1.88.50-linux-x86_64.tar.gz"
        sha256 "234830ee4bf289551cd6f6cfcc86c2decc43529cb1c1e27e49e0f1c2d816778b"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.50/pact-1.88.50-linux-x86.tar.gz"
        sha256 "cf1b7c732b775bf2ed15cfd4d1d2e63eb8245387f5018c2587b1380a9d802132"
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
