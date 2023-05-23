class PactPluginCli < Formula
  desc "Standalone Pact Plugin CLI executable"
  homepage "https://github.com/pact-foundation/pact-plugins"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-plugins/releases/download/pact-plugin-cli-v0.1.0/pact-plugin-cli-osx-aarch64.gz"
      sha256 "ccf1f2bbd5d1138b205a22660fe06fccbaa5dc97fdf4d63b73dd2d22d67690a7"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-plugins/releases/download/pact-plugin-cli-v0.1.0/pact-plugin-cli-osx-x86_64.gz"
      sha256 "27a33222dddab807f81ae48afcfc15276ff6214a3ad44b0f2374b0dc15d5672e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-plugins/releases/download/pact-plugin-cli-v0.1.0/pact-plugin-cli-linux-aarch64.gz"
      sha256 "d16eb8e81a76441f6e984814b33e3a280ca9a1c6a90a51651b3eb42baa28388b"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-plugins/releases/download/pact-plugin-cli-v0.1.0/pact-plugin-cli-linux-x86_64.gz"
      sha256 "9c6e00506f5e84ce0f0542530aa7c45aaa75c32a6772efc5794d57dc17dd4fb1"
    end
  end

  def install
    # pact-reference
    bin.install Dir["*"]; puts "# Run 'pact-plugin-cli --help'"
  end

  test do
    system "#{bin}/pact-plugin-cli", "--help"
  end
end
