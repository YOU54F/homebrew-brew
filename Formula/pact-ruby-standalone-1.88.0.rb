class PactRubyStandalone1880 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.0/pact-1.88.0-osx.tar.gz"
      sha256 "fa55ed3b781c88739a002186a9a1814c83c718aacdf991fc1e214649a1b372ce"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.0/pact-1.88.0-osx.tar.gz"
      sha256 "fa55ed3b781c88739a002186a9a1814c83c718aacdf991fc1e214649a1b372ce"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.0/pact-1.88.0-linux-x86_64.tar.gz"
        sha256 "778db2ae8ac95253988d75d8e25220043d42295383171ab9d3a23e6d6f05f9f4"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.0/pact-1.88.0-linux-x86.tar.gz"
        sha256 "40573b531d0f543cf62b499878dff55b0a600d6a540f93d8b973126334b783ca"
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
