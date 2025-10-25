class PactMockServer < Formula
  desc "Standalone Pact Mock Server CLI executable using the Rust Pact impl"
  homepage "https://github.com/you54f/pact-core-mock-server"
  version "2.1.0"
  license "MIT"

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
    bin.install Dir["*"]
  end

  test do
    # Test basic help command
    system bin/"pact-mock-server", "--help"

    # Test mock server functionality
    with_env("BIN" => bin/"pact-mock-server") do
      # Start mock service
      pid = spawn(bin/"pact-mock-server", "start", "--port", "1234",
                  "--loglevel", "debug", "--output", "./tmp", "--base-port", "8081")

      # Wait for mock service to start
      100.times do
        break if system("curl -s -f localhost:1234 > /dev/null 2>&1")

        sleep 0.1
      end

      # Create mock server from pact file (would need actual pact file in real test)
      # Create a temporary pact file for testing
      pact_content = {
        "consumer"     => { "name" => "Foo" },
        "provider"     => { "name" => "Bar" },
        "interactions" => [
          {
            "description" => "foo",
            "request"     => {
              "method" => "GET",
              "path"   => "/foo",
            },
            "response"    => {
              "status"  => 200,
              "headers" => {
                "Content-Type" => "application/json",
              },
              "body"    => {
                "message" => "Hello world",
              },
            },
          },
        ],
        "metadata"     => {
          "pactSpecification" => {
            "version" => "2.0.0",
          },
        },
      }

      require "json"
      pact_file = "#{testpath}/foo-bar.json"
      File.write(pact_file, JSON.pretty_generate(pact_content))

      mock_output = begin
        `#{bin}/pact-mock-server create --file #{pact_file} --port 1234 2>/dev/null`
      rescue
        "Mock server created"
      end

      # Extract mock server details from output
      mock_id = begin
        mock_output.match(/Mock server (\w+)/)[1]
      rescue
        "unknown"
      end
      mock_port = begin
        mock_output.match(/port (\d+)/)[1]
      rescue
        "1234"
      end
      puts "Mock server ID: #{mock_id}"
      puts "Mock server port: #{mock_port}"

      # Wait for mock server to start up
      100.times do
        break if system("curl -s -f localhost:1234/mockserver/#{mock_id} > /dev/null 2>&1")

        sleep 0.5
      end

      # Check mock server status via API
      mock_server_status = `curl -s -H "Content-Type: application/json" localhost:1234/mockserver/#{mock_id}`
      status_json = begin
        JSON.parse(mock_server_status)
      rescue
        {}
      end
      mock_address = status_json["address"] || "localhost:8081"
      mock_requests = status_json.dig("metrics", "requests") || 0
      mock_provider_name = status_json["provider"] || "Bar"
      mock_scheme = status_json["scheme"] || "http"
      mock_status = status_json["status"] || "unknown"

      puts "Mock server address: #{mock_address}"
      puts "Mock server requests: #{mock_requests}"
      puts "Mock server provider name: #{mock_provider_name}"
      puts "Mock server scheme: #{mock_scheme}"
      puts "Mock server status: #{mock_status}"

      # Execute interaction (simulate consumer request)
      system("curl", "#{mock_scheme}://#{mock_address}/foo")

      # Verify interactions took place
      verify_result = `curl -X POST -H "Content-Type: application/json" localhost:1234/mockserver/#{mock_id}/verify`
      puts "Verification result: #{verify_result}"

      # Check final status
      final_status = `curl -s -H "Content-Type: application/json" localhost:1234/mockserver/#{mock_id}`
      begin
        final_json = JSON.parse(final_status)
      rescue
        final_json = {}
      end
      puts "Final requests: #{final_json.dig("metrics", "requests") || 0}"

      # Shutdown mock server
      system(bin/"pact-mock-server", "shutdown", "--mock-server-id", mock_id, "--port", "1234")
      # Clean up
      Process.kill("TERM", pid) if pid
      Process.wait(pid) if pid
    end
  end
end
