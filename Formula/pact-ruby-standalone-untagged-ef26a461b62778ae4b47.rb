class PactRubyStandaloneUntaggedEf26a461b62778ae4b47 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "untagged-ef26a461b62778ae4b47"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/untagged-ef26a461b62778ae4b47/pact-0.0.1-1-osx.tar.gz"
      sha256 "4d95647a401c41b2e22c0136549ccb111e5fbfbb55773d9a59b2bfc9d92330a7"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/untagged-ef26a461b62778ae4b47/pact-0.0.1-1-osx.tar.gz"
      sha256 "4d95647a401c41b2e22c0136549ccb111e5fbfbb55773d9a59b2bfc9d92330a7"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/untagged-ef26a461b62778ae4b47/pact-0.0.1-1-linux-x86_64.tar.gz"
        sha256 "1c0d14f8bca895902969b384951f795bde15484fb0956adff6f92bca3babdb16"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/untagged-ef26a461b62778ae4b47/pact-0.0.1-1-linux-x86.tar.gz"
        sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
