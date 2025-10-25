class PactPlugin < Formula
  desc "Standalone Pact Plugin CLI executable"
  homepage "https://github.com/you54f/pact-plugins"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/you54f/pact-plugins/releases/download/pact-plugin-cli-v0.2.0/pact-plugin-macos-aarch64.gz"
      sha256 "d998e620d2872baabc2864eb84912ea381a04a50f35646f458982778a5071964"
    end
    on_intel do
      url "https://github.com/you54f/pact-plugins/releases/download/pact-plugin-cli-v0.2.0/pact-plugin-macos-x86_64.gz"
      sha256 "486c4aef353fc4d9acdbf0e9a5e1e7e795b81e6859be503c52d34ca3e06578f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/you54f/pact-plugins/releases/download/pact-plugin-cli-v0.2.0/pact-plugin-linux-aarch64.gz"
      sha256 "d48a35e8cac979425ba6e1ef631df573d6f0232b0af05915dd743ca3db376e23"
    end
    on_intel do
      url "https://github.com/you54f/pact-plugins/releases/download/pact-plugin-cli-v0.2.0/pact-plugin-linux-x86_64.gz"
      sha256 "733ef8a702074b545111b922593f9c4ca7e96b8683acdb772f726a75b0e3c584"
    end
  end

  def install
    bin.install Dir["*"]
    puts "# Run 'pact-plugin --help'"
  end

  test do
    system bin/"pact-plugin", "list", "known"
    assert_match "protobuf", shell_output("#{bin}/pact-plugin list known")
    assert_match "csv", shell_output("#{bin}/pact-plugin list known")
    assert_match "avro", shell_output("#{bin}/pact-plugin list known")
  end
end
