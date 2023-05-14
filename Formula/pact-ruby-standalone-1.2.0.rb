class PactRubyStandalone120 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.0/pact-1.2.0-osx.tar.gz"
      sha256 "ba175fdca902d844c02d0295a2b9c05a12e4cd2b7e50af49bde2dab066867a6d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.0/pact-1.2.0-osx.tar.gz"
      sha256 "ba175fdca902d844c02d0295a2b9c05a12e4cd2b7e50af49bde2dab066867a6d"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.0/pact-1.2.0-linux-x86_64.tar.gz"
        sha256 "27e49b8574ce41bfd1d3f0c32288d8a0a6964e188ae2db5d13cb20cb6e795e45"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.0/pact-1.2.0-linux-x86.tar.gz"
        sha256 "c9c666deea52477cc8813ead0031863f1067bdea680f2390e1c23edb617d0bfb"
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
