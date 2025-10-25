class PactVerifier < Formula
  desc "Standalone Pact Verifier CLI executable using the Rust Pact impl"
  homepage "https://github.com/you54f/pact-reference"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-macos-aarch64.gz"
      sha256 "f77f897beeacf6d4b67d6c43c70651912f003cf852e68629e8772648fba364a0"
    end
    on_intel do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-macos-x86_64.gz"
      sha256 "f2554fd3edb3296e2963a40b0428a4f51fec37f76f15e359c7af27a545ab5161"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-linux-aarch64.gz"
      sha256 "4457844674440feefe773c55fb94b82d2bd4e9e12d5f91f2a40569df379198d3"
    end
    on_intel do
      url "https://github.com/you54f/pact-reference/releases/download/pact_verifier_cli-v1.3.0/pact-verifier-linux-x86_64.gz"
      sha256 "f02275a64ceacabeaf6a5128e9b8f004f51354f6c1ff83cdc6e6b218ba34da0a"
    end
  end

  def install
    bin.install Dir["*"]
    puts "# Run 'pact-verifier --help'"
  end

  test do
    # Create a simple pact file for testing
    pact_file = testpath/"test.json"
    pact_file.write <<~JSON
      {
        "consumer": {
          "name": "anotherclient"
        },
        "provider": {
          "name": "they"
        },
        "interactions": [
          {
            "description": "Greeting",
            "request": {
              "method": "GET",
              "path": "/"
            },
            "response": {
              "status": 200,
              "headers": {
              },
              "body": {
                "greeting": "Hello"
              }
            }
          },
          {
            "description": "Provider state success",
            "providerState": "There is a greeting",
            "request": {
              "method": "GET",
              "path": "/somestate"
            },
            "response": {
              "status": 200,
              "headers": {
              },
              "body": {
                "greeting": "State data!"
              }
            }
          }
        ],
        "metadata": {
          "pactSpecification": {
            "version": "2.0.0"
          }
        }
      }
    JSON

    # Test basic help command
    system bin/"pact-verifier", "--help"

    # Test that the binary exists and is executable
    assert_path_exists bin/"pact-verifier"
    assert_predicate bin/"pact-verifier", :executable?

    # Test version output
    output = shell_output("#{bin}/pact-verifier --version")
    assert_match version.to_s, output

    # Run verifier against test API
    verifier_output = shell_output([
      "#{bin}/pact-verifier",
      "--hostname", "localhost",
      "--port", "4567",
      "--file", pact_file.to_s,
      "--state-change-url", "http://localhost:4567/provider-state",
      "--no-colour"
    ].join(" "), 1)
    puts verifier_output
    assert_match "Verifying a pact between anotherclient and they", verifier_output
    assert_match "There were 2 pact failures", verifier_output
  end
end
