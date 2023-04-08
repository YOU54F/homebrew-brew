class PactRubyStandalone < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/you54f/pact-ruby-standalone"
  url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.0.0/pact-3.0.0-osx-arm64.tar.gz"
  sha256 "29caaaa05e8a97d454f8c251bf4642e9999e8e7d5e4b3dc1c74b3ad45f2d13ce"

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]

    puts "# Run 'pact-mock-service --help' (see https://github.com/you54f/pact-ruby-standalone/releases/)"
  end

  test do
    system "#{bin}/pact-mock-service", "help"
  end
end
