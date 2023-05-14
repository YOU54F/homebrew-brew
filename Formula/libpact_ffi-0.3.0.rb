class LibpactFfi030 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.0/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "e627aca98ac7bc02460a973f8ee1290b43337a02ef104b9a5041ff7e00e9c33a"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.0/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "3f5ec958cb3cd7a90b30223c902d1a2913e54e1ae1d20121aa4141a32ae49b87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.0/libpact_ffi-linux-x86_64.so.gz"
      sha256 "4da7b2d7b6db0312d2b73ac152e40cf8c4ac64d53cc653e31bdc0729c5bc7e82"
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
