class PactStubServer < Formula
  desc "Standalone Pact Stub Server executable"
  homepage "https://github.com/you54f/pact-stub-server"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-stub-server/releases/download/v0.7.0/pact-stub-server-macos-aarch64.gz"
      sha256 "b0c3cba3fc1878649c2b54b1c54655ce58fc370026e664753dd6b06369711d47"
    end
    on_intel do
      url "https://github.com/you54f/pact-stub-server/releases/download/v0.7.0/pact-stub-server-macos-x86_64.gz"
      sha256 "9d04f741ea32f0c649b6acf6954b4cbd5823d5d17ebe8f5f622002744fc21425"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-stub-server/releases/download/v0.7.0/pact-stub-server-linux-aarch64.gz"
      sha256 "bafb3995af0b8180a9238f4d9726c9794c8edfd514fcbf82760a627c16cc370c"
    end
    on_intel do
      url "https://github.com/you54f/pact-stub-server/releases/download/v0.7.0/pact-stub-server-linux-x86_64.gz"
      sha256 "9b13ee211ccc5037fdaa72a15dc577e0986bac34b6abcddf619db552e70cd131"
    end
  end

  def install
    bin.install Dir["*"]
    puts "# Run 'pact-stub-server --help'"
  end

  test do
    system bin/"pact-stub-server", "--help"

    # Test that we can create a simple pact file (mock functionality)
    test_pact = testpath/"test.json"
    test_pact.write <<~EOS
      {
        "consumer": { "name": "TestConsumer" },
        "provider": { "name": "TestProvider" },
        "interactions": [
          {
            "description": "a test interaction",
            "request": {
              "method": "GET",
              "path": "/test"
            },
            "response": {
              "status": 200,
              "body": "test response"
            }
          }
        ],
        "metadata": {
          "pactSpecification": { "version": "2.0.0" }
        }
      }
    EOS

    # Test that stub server can start and respond with the pact file
    port = 9999
    pid = spawn("#{bin}/pact-stub-server --file #{test_pact} --port #{port}")
    sleep 2 # Give server time to start

    begin
      response = shell_output("curl -s http://localhost:#{port}/test")
      assert_match "test response", response
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
