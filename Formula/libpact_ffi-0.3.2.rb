class LibpactFfi032 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.2/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "448a6e18f9a494d98e719401f6aa1f440d88853d6292b64a271ba0a3b6ab4b19"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.2/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "5bbfde5a40712a0715e03ce858805a0872deec86eded621c99e011fe401938d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.2/libpact_ffi-linux-x86_64.so.gz"
      sha256 "bff8ec169f22bc83986c987de3f5cfa5dad6451c9545b933fe23caa8389fd317"
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
