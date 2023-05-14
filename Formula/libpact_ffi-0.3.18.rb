class LibpactFfi0318 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.18"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.18/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "fe04076ec470725aafc7b407cd51b157505b9a107761e0f1b3e5696b30d02f0f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.18/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "634e74e701afb6588282a3d0d146045e7cf3d58a893478892486d248b1e7b8ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.18/libpact_ffi-linux-aarch64.so.gz"
      sha256 "d454348caacb9744c71c35a551d293e9c19414876d19f1b6cd408058c8a1ee16"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.18/libpact_ffi-linux-x86_64.so.gz"
      sha256 "559e13d23b4f22eef02c00430fb4659eeffc3c21d461cf1423ba18d6f58fe1b2"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
