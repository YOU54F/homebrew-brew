class PactRubyStandalone100 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.0/pact-1.0.0-osx.tar.gz"
      sha256 "f8a8bdd0ff33f911a0acf5d20bc54264dd037b06d45c96978b8df429d663e550"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.0/pact-1.0.0-osx.tar.gz"
      sha256 "f8a8bdd0ff33f911a0acf5d20bc54264dd037b06d45c96978b8df429d663e550"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.0/pact-1.0.0-linux-x86_64.tar.gz"
        sha256 "689ce670a92176bb810690a734319f38f1044591c02172004c24ea9541e1426f"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.0.0/pact-1.0.0-linux-x86.tar.gz"
        sha256 "f8b6af528b8bf6306f277acf59e390e7650b0f8238849e49ba560caf9097411a"
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
