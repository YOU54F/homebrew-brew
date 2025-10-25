class PactRubyStandalone < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Traveling Ruby"
  homepage "https://github.com/you54f/pact-standalone"
  version "2.5.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/you54f/pact-standalone/releases/download/v2.5.6/pact-2.5.6-osx-x86_64.tar.gz"
      sha256 "dff43438408be2924a72143d464b706ce7860ab3c9e247a4e33a0f5016de3f31"
    end
    on_arm do
      url "https://github.com/you54f/pact-standalone/releases/download/v2.5.6/pact-2.5.6-osx-arm64.tar.gz"
      sha256 "c8b243023df2076155ef9ea0dd0defccbf59320907ccbe7dbdb453476ad3b6db"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/you54f/pact-standalone/releases/download/v2.5.6/pact-2.5.6-linux-x86_64.tar.gz"
      sha256 "a52dd787ffb6373cbfa92e273db918a36457290e1594b21eb5c9b69f3d78e240"
    end
    on_arm do
      url "https://github.com/you54f/pact-standalone/releases/download/v2.5.6/pact-2.5.6-linux-arm64.tar.gz"
      sha256 "1fa703c7fdd01270160d63d6b1dc17b1e8dde0861ce185060818f9261c9cbd52"
    end
  end

  def install
    # pact-standalone
    bin.install Dir["bin/*"].reject { |f| f.end_with?("/pact") }
    lib.install Dir["lib/*"]
    puts "# Run 'pact-mock-service --help' (see https://github.com/you54f/pact-standalone/releases/)"
  end

  test do
    system "#{bin}/pact-broker", "help"
    system "#{bin}/pact-message", "help"
    system "#{bin}/pact-plugin-cli", "help"
    system "#{bin}/pact-mock-service", "help"
    system "#{bin}/pact-provider-verifier", "help"
    system "#{bin}/pact-stub-service", "help"
    system "#{bin}/pactflow", "help"
  end
end
