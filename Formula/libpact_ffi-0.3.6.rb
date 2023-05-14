class LibpactFfi036 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.6"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.6/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "0ff41ba78f02183a64d63ad334754fb0d255ff5f8ca9f690bf83fc60c676d8e7"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.6/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "fb66aba11d71f1491c2ba8f94ae0eaf4b9a467b91d9d2b46b9f29117e369534f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.6/libpact_ffi-linux-x86_64.so.gz"
      sha256 "1bebe8805b452bd1bad3003e0fdfe75a8a1fbd5a9c8be74058de1b93ecc3a4dc"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
