class LibpactFfi0311 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.11"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.11/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "e84fcb7037bb58a81c4fbb1d573f2801bf80a7b6db41b7528318cdc7fc6217e0"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.11/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "958b0ca326abf8905be794b61a168523f4b2779acb8661989e29cfe0aa8cb04f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.11/libpact_ffi-linux-aarch64.so.gz"
      sha256 "e3dc06af6f63f8cf4034fc4b6e2bc084ca6e72a8d4bf496f433d3545b3db93f8"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.11/libpact_ffi-linux-x86_64.so.gz"
      sha256 "abe40501b58e07d26c9b42047c444e5bc339e3604fd140d0d9dc5f9094eaa8d3"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
