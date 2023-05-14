class PactRubyStandalone122 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.2.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.2/pact-1.2.2-osx.tar.gz"
      sha256 "db766307fea88cea77b272141dee58953f197c34e30520ded22edfc4c5fce6ae"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.2/pact-1.2.2-osx.tar.gz"
      sha256 "db766307fea88cea77b272141dee58953f197c34e30520ded22edfc4c5fce6ae"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.2/pact-1.2.2-linux-x86_64.tar.gz"
        sha256 "7cc45e160ef79d7ff117ae94399bc40f71fa12c1ba5ac3bceff73254d171d1fd"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.2.2/pact-1.2.2-linux-x86.tar.gz"
        sha256 "4503e880ab0e37133ccec87df3230291d62ac4f9bed067680accd2993ec623ba"
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
