class LibpactFfi0315 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.15"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.15/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "47a1bf0311fbd02808a5f488e4ff3904beb64f22612dcbb0348d4c2103dc72d3"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.15/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "20fb4ec612631021bd3419a7d60d201210deb5fc323ed811f2cb05decf8d18ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.15/libpact_ffi-linux-aarch64.so.gz"
      sha256 "5826a797a09518e35c0cd897980f8da0f95c43680f53070351daa77064a65e9b"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.15/libpact_ffi-linux-x86_64.so.gz"
      sha256 "5a6463f6ebdc3c0b4c9623ec01ec633fdd6e93cf7ac36d6e63fa84669354fc82"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end

  test do
    system "#{bin}/libpact_ffi", "help"
  end
end
