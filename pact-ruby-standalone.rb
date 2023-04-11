class PactRubyStandalone < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/you54f/pact-ruby-standalone"
  version "3.1.2.1-alpha"
  
  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.2.1-alpha/pact-3.1.2.1-alpha-osx-arm64.tar.gz"
      sha256 "d84030d11ca3c274082850dd431154d739201cb43bcd05950ce7a51ac8897387"
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
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.2.1-alpha/pact-3.1.2.1-alpha-osx-x86_64.tar.gz"
      sha256 "005f53146e9fb7a404e206e07b43972e37d1c81d9fb131ef8810d29707e2271f"
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
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.2.1-alpha/pact-3.1.2.1-alpha-linux-arm64.tar.gz"
      sha256 "dcc73e5fdb8c5489b8e6f49de6221490f57f45b05f99363558f7856b3fb2d52b"
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
      url "https://github.com/you54f/pact-ruby-standalone/releases/download/v3.1.2.1-alpha/pact-3.1.2.1-alpha-linux-x86_64.tar.gz"
      sha256 "dcfc20b839467a430278d5ee7c4a31ee3eb80b2d651ac9a9306a636efb53fecd"
      resource "pact_verifier_cli" do
          url "https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v0.10.5/pact_verifier_cli-linux-x86_64.gz"
          sha256 "48a5d6bbc5471764e77027eaf42f62f812849b083e267be2cb8ed9d36cc862bf"
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
