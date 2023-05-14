class LibpactFfi033 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.3/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "28135e2a3d9fa8d9ac38ad18c17f9e0c93a6fada61a71e0d4f2a95615bf8b0fa"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.3/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "3ffd86fd7b49de17a07a36aeac599e831401f9551d041d0bcb817a66d7342c4c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.3/libpact_ffi-linux-x86_64.so.gz"
      sha256 "8db737913565b1c3b771c0676e6f0de289309584d28b044e3a17c6524ca41224"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
