class LibpactFfi003 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.0.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.3/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "2aa0af0ca35e3c86dd2e00ad3755a4e6507142448b1ed7659b7d4688a9112abc"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.3/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "c701f70f88dda94427a1a408329de180b854240d0ec6d22e7e5e77b0960c88f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.3/libpact_ffi-linux-x86_64.so.gz"
      sha256 "8e71dddff2d99a281a1178386d9c3a6bbddafbc06bc0a4dcda436300de139a4d"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
