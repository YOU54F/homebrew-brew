class PactBrokerClient < Formula
  desc "Client for interacting with Pact Broker"
  homepage "https://github.com/pact-foundation/pact-broker-cli"
  url "https://github.com/pact-foundation/pact-broker-cli.git"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  head do
    url "https://github.com/pact-foundation/pact-broker-cli.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_intel do
      url "https://github.com/pact-foundation/pact-broker-cli/releases/download/v0.4.1/pact-broker-cli-x86_64-macos"
      sha256 "da9b268fb75a7cf65fcc5a1d50b00d0fbba175bd02deeb9a228a3d38322f03e6"
    end

    on_arm do
      url "https://github.com/pact-foundation/pact-broker-cli/releases/download/v0.4.1/pact-broker-cli-aarch64-macos"
      sha256 "23d0bea11e81d434c2bef026b2de3c97d8c177d0f739e579a5b6025c2c573ee3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-broker-cli/releases/download/v0.4.1/pact-broker-cli-x86_64-linux-musl"
      sha256 "1b8b028751a3d9d3157e6978d2d155e714e7b705d8c50f3e9ee7f90f9f1dae7e"
    end

    on_arm do
      url "https://github.com/pact-foundation/pact-broker-cli/releases/download/v0.4.1/pact-broker-cli-aarch64-linux-musl"
      sha256 "6b94f42b9c2b982c2170c5b7ff068836bbd97ccd1178a33b94e8bf234a34a081"
    end
  end

  def install
    if build.head?
      # Build from source if no precompiled binary is available
      system "cargo", "install", *std_cargo_args
    elsif OS.mac?
      if Hardware::CPU.intel?
        bin.install "pact-broker-cli-x86_64-macos" => "pact-broker-client"
      else
        bin.install "pact-broker-cli-aarch64-macos" => "pact-broker-client"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        bin.install "pact-broker-cli-x86_64-linux-musl" => "pact-broker-client"
      else
        bin.install "pact-broker-cli-aarch64-linux-musl" => "pact-broker-client"
      end
    end
  end

  test do
    # Test that the binary is properly linked and executable
    assert_predicate bin/"pact-broker-client", :executable?

    # Test error handling - invalid command should fail gracefully
    shell_output("#{bin}/pact-broker-client invalid-command", 2)

    # Test the pact-broker-client command with an inaccessible broker
    args = [
      "list-latest-pact-versions",
      "--broker-base-url",
      "http://localhost:9292",
    ]
    output = shell_output("#{bin}/pact-broker-client #{args.join(" ")} 2>&1", 1)

    # Should fail gracefully when broker is not accessible
    assert_match(/Failed to access pact broker/, output)
  end
end
