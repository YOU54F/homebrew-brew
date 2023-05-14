class PactRubyStandalone1471 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.47.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.1/pact-1.47.1-osx.tar.gz"
      sha256 "01e6e325c76e7bb1168993adcdda96dc5bec215d7463e0f9dc78793c2aa24ab5"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.1/pact-1.47.1-osx.tar.gz"
      sha256 "01e6e325c76e7bb1168993adcdda96dc5bec215d7463e0f9dc78793c2aa24ab5"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.1/pact-1.47.1-linux-x86_64.tar.gz"
        sha256 "6e134eefe8a59b7c4cb023e19c4448a23ecb653b8e1345034a01040200985f61"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.47.1/pact-1.47.1-linux-x86.tar.gz"
        sha256 "8df1af65cb86dc3927a00b55c5940749dace4d48847b9e68e4125db0a3ba2fda"
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
