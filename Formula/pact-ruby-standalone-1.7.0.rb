class PactRubyStandalone170 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.7.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.0/pact-1.7.0-osx.tar.gz"
      sha256 "369b98db969077b075bc5e78d2074bd70ab587c290e28d5188f99f96bc1e9b51"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.0/pact-1.7.0-osx.tar.gz"
      sha256 "369b98db969077b075bc5e78d2074bd70ab587c290e28d5188f99f96bc1e9b51"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.0/pact-1.7.0-linux-x86_64.tar.gz"
        sha256 "e6ee0bf905ff5a9b2aa1aff720947d53edb9e5af7e7f0602dd4b63f31d9aca1d"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.7.0/pact-1.7.0-linux-x86.tar.gz"
        sha256 "71a1e4c79a126b10b441b0dba9971b841754cc77397567b81aace19791b2b6f9"
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
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
