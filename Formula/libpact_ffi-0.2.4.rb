class LibpactFfi024 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.4/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "ed5e3aa741e7a5ca14b1d4351041a014e902ed4acab3fea71fe5a91457af5974"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.4/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "c8b184233b1bcb00d585d9a211562756eb09a2582f6a18f41ce1925c87173ab6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.4/libpact_ffi-linux-x86_64.so.gz"
      sha256 "f300068a6e0df363a482f497d0b47a612c12a7991be4c1d6591796f1536b9d66"
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
