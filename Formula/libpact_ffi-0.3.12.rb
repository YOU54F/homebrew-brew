class LibpactFfi0312 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.12"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.12/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "baa9f5219da6cc73f7dc3a445d2954f41d496c21d4a4f76de6f39dbde4d3571a"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.12/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "9b1be94ba3161b2cfb33671b7060c413f2978bde13f5957fd9f1ac5e980c492f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.12/libpact_ffi-linux-aarch64.so.gz"
      sha256 "3decf6d512935c6c8af6fc900c4f4cddd68d1f5860eb4e2684bc803a8e13e3fb"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.12/libpact_ffi-linux-x86_64.so.gz"
      sha256 "878eb96fec9e1ac7ac3a8c0e02a1075bf4d43e947fc5211684161790713f3d12"
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
