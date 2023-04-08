class PactRubyStandalone < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/you54f/pact-ruby-standalone"
  
  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.0.0/pact-3.0.0-osx-arm64.tar.gz"
      sha256 "29caaaa05e8a97d454f8c251bf4642e9999e8e7d5e4b3dc1c74b3ad45f2d13ce"
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.0.0/pact-3.0.0-osx-x86_64.tar.gz"
      sha256 "78c8dcf780a94757a1875067409fe8c0b7b6966bf4b68ff3ee0e86c05ee91293"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.0.0/pact-3.0.0-linux-arm64.tar.gz"
      sha256 "adc3ff0df2b9bf80051f17a3a769b94efb2d8be0d4fe30a7fefb5404d579ee2c"
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.0.0/pact-3.0.0-linux-x86_64.tar.gz"
      sha256 "cb97b2fd1f23bc0b4c103db5a6e2d1b5d9d60039af59e93775fcbd3d24d40e70"
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
