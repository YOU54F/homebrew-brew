class LibpactFfi041 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.1/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "30e015522c7a3b6a630a0f6cc579070c89baec8884e1875ba86f8806d42a9f7b"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.1/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "a82d4e478f4093964606d4bddd501e7515ebf3e72dfc62f237595f3336957172"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.1/libpact_ffi-linux-aarch64.so.gz"
      sha256 "91c36414f03a085d9c1d1f08a415804ab46a40952385e9d1bf2a8d172b26592e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.1/libpact_ffi-linux-x86_64.so.gz"
      sha256 "6c43a0bd948cfc6c4ae67294fe7ba06a1cc0e62573bddeca24007a0c764d3cfd"
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
