class LibpactFfi013 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.3/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "abbed6c7e4c699e5300756b99ee2ca83e9efeaaa3d34bbbd1a28893e67d521d1"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.3/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "8b5ce19f5b0390aa491f00f6afb41871574a80cba33f808fc8f7f46029dc4907"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.3/libpact_ffi-linux-x86_64.so.gz"
      sha256 "621d5ad56ecbe8fbbd71ceeea515c30c5088bd60878dc1e7701d9bf20ef776d6"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
