class PactRubyStandalone < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/you54f/pact-ruby-standalone"
  
  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-osx-arm64.tar.gz"
      sha256 "26675141503abcaf5eb7ed504abd6e3e165631bc2762a315ce54d9b7124a0ff6"
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-osx-x86_64.tar.gz"
      sha256 "ba8f2f1504a261b7e6c0879bea3926b67102942efc982dec8255e0cf93f42b94"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-linux-arm64.tar.gz"
      sha256 "41b271ca318f17ba90e6014d54226021526066e43ddad5e270e31522ef200720"
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-linux-x86_64.tar.gz"
      sha256 "94befa09a693527c89b357fad0328d088eb076a72b28ba97ab45d05d7c24980d"
    end
  end

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]

    puts "# Run 'pact-mock-service --help' (see https://github.com/you54f/pact-ruby-standalone/releases/)"
  end

  test do
    system "#{bin}/pact-mock-service", "help"
  end
end
