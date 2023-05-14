class LibpactFfi038 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.8"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.8/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "afe633fb0dc1592d9f408ce2053ab796818c16829e1c6c7cfec7521914a3e30d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.8/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "73837190c8059e225d6751081133c6654775bfb247b3b171596e0903250fa8ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.8/libpact_ffi-linux-aarch64.so.gz"
      sha256 "ab29490a5274a980af37fae02988615dd99076010f6132c29cda571f40d5c862"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.8/libpact_ffi-linux-x86_64.so.gz"
      sha256 "9f62a3ed90f86a4bb2d8c64504a7eb5ae743b81be62f3cbeaa51304fd709a8fe"
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
