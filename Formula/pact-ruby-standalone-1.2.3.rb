class PactRubyStandalone123 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.2.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.3/pact-1.2.3-osx.tar.gz"
      sha256 "e09596dbedeef65b1137d568395037a57248f75e25b08629baa3de8145558270"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.3/pact-1.2.3-osx.tar.gz"
      sha256 "e09596dbedeef65b1137d568395037a57248f75e25b08629baa3de8145558270"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.3/pact-1.2.3-linux-x86_64.tar.gz"
        sha256 "7b5fe272989e1387270aee098edcb9ebeb544cf9e146b5ecb2e38d0ac8b2e976"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.3/pact-1.2.3-linux-x86.tar.gz"
        sha256 "e3aeba01d2fe424b01563e021100f53ecfea909371606618b2a92dd5989adb6f"
      end
    end
  end

  def install
    # pact-ruby-standalone
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    puts "# (see https://github.com/pact-foundation/pact-ruby-standalone/releases/)'"
    puts "# Run 'pact-broker --help'"
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
  end

  test do
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
