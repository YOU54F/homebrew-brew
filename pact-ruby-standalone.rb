class PactRubyStandalone < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/you54f/pact-ruby-standalone"
  version "3.1.0"
  
  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-osx-arm64.tar.gz"
      sha256 "26675141503abcaf5eb7ed504abd6e3e165631bc2762a315ce54d9b7124a0ff6"
      resource "pact_verifier_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-osx-aarch64.gz"
          sha256 "e6651e4dab1ad381d9f34fa3a9f12c7756b1bf778d864ab0893fa6078b2a98e8"
      end
      resource "pact_mock_server_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-osx-x86_64.gz"
          sha256 "4f29dc624dd1b4862170c029e59ba648dcf9cb9d306ca79279b3897d7e0faf56"
      end
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-osx-x86_64.tar.gz"
      sha256 "ba8f2f1504a261b7e6c0879bea3926b67102942efc982dec8255e0cf93f42b94"
      resource "pact_verifier_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-osx-x86_64.gz"
          sha256 "042ba537784472a65722d5b1301f4d1d61486d7220fbae2691812c44f58350dc"
      end
      resource "pact_mock_server_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-osx-x86_64.gz"
          sha256 "4f29dc624dd1b4862170c029e59ba648dcf9cb9d306ca79279b3897d7e0faf56"
      end
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-linux-arm64.tar.gz"
      sha256 "41b271ca318f17ba90e6014d54226021526066e43ddad5e270e31522ef200720"
      resource "pact_verifier_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-linux-aarch64.gz"
          sha256 "48a5d6bbc5471764e77027eaf42f62f812849b083e267be2cb8ed9d36cc862bf"
      end
      resource "pact_mock_server_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-linux-aarch64.gz"
          sha256 "3445c2109ec1fc7a58d012c5a851f67203a6b19e3ef7f21d09fdac6b3d140f30"
      end
    end
    on_intel do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.0/pact-3.1.0-linux-x86_64.tar.gz"
      sha256 "94befa09a693527c89b357fad0328d088eb076a72b28ba97ab45d05d7c24980d"
      resource "pact_verifier_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-linux-x86_64.gz"
          sha256 "8426c38ca361613bc4df649f14e40c9c3609672b56797e3c487aba2860c5040d"
      end
      resource "pact_mock_server_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.0/pact_mock_server_cli-linux-x86_64.gz"
          sha256 "f07fe85eab349d9d8f6f60faffb8d4af02d8d0bbe8e7a756b6b5e136a837cd92"
      end
    end
  end

  def install
    # pact-ruby-standalone
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    puts "# Run 'pact-mock-service --help' (see https://github.com/you54f/pact-ruby-standalone/releases/)"

    # pact-reference
    resource("pact_verifier_cli").stage { bin.install Dir["*"]; puts "# Run 'pact_verifier_cli --help'" }
    resource("pact_mock_server_cli").stage { bin.install Dir["*"]; puts "# Run 'pact_mock_server_cli --help'" }

  end

  test do
    system "#{bin}/pact-mock-service", "help"
  end
end
