class PactRubyStandalone001 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v0.0.1/pact-0.0.1-osx.tar.gz"
      sha256 "26008cb8be966dfe77dd9aff54af3c3549db5a06a0765e3c4e63d41e111a01f7"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v0.0.1/pact-0.0.1-osx.tar.gz"
      sha256 "26008cb8be966dfe77dd9aff54af3c3549db5a06a0765e3c4e63d41e111a01f7"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v0.0.1/pact-0.0.1-linux-x86_64.tar.gz"
        sha256 "9f64f818bfbbd65bd2ad557f56763dfe34180d1aba36106284353743bf9a70bb"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v0.0.1/pact-0.0.1-linux-x86.tar.gz"
        sha256 "0f7d293a679ec00f38ede10d9cc90017d546f08e346e855d821334030e6fa30f"
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
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
    on_macos do
      on_arm do
        puts "# Rosetta is required to run pact-ruby-standalone commands"
        puts "# sudo softwareupdate --install-rosetta --agree-to-license"
      end
    end
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
