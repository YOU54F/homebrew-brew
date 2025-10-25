class PactMockServer < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/you54f/pact-core-mock-server"
  version "2.1.0"

  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-core-mock-server/releases/download/pact_mock_server_cli-v2.1.0/pact-mock-server-macos-aarch64.gz"
      sha256 "44b2afe478dd3c4526450f1e0d600e189288045b0714c68fcfa9dde5b2345e52"
    end
    on_intel do
      url "https://github.com/you54f/pact-core-mock-server/releases/download/pact_mock_server_cli-v2.1.0/pact-mock-server-macos-x86_64.gz"
      sha256 "b11a75ca1cdfd8704d4bbfe94bd006219dab7d9b345cc6ce59120a5fcd7e957b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-core-mock-server/releases/download/pact_mock_server_cli-v2.1.0/pact-mock-server-linux-aarch64.gz"
      sha256 "8d91fa78189d2240ec29464f38a848cda63a89f30a8cba6b3e8dfb8f0c8c8147"
    end
    on_intel do
      url "https://github.com/you54f/pact-core-mock-server/releases/download/pact_mock_server_cli-v2.1.0/pact-mock-server-linux-x86_64.gz"
      sha256 "64829c191c49aba1b5a0c4918589e03801bfff1b97d8f7237fc1096aad1fe284"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact-mock-server --help'"
  end

  test do
    system "#{bin}/pact-mock-server", "--help"
  end
end
