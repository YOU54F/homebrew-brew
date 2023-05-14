class LibpactFfi001 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.1/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "4856ac43b766f90211bec79c5ffb074e5b1a91bc0a9907434d9a62a0c9535b8e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.1/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "eb557262bcab82a8135f37aff01373eb2a9bedc03a98c9d3bd544916054bbbce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.1/libpact_ffi-linux-x86_64.so.gz"
      sha256 "5d40f9667664c9c3efe26489f272a24e702718715038d85a1bee5d50098a88ec"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n"; exec "ls #{bin}"
  end

  test do
    system "#{bin}/libpact_ffi", "help"
  end
end
