class LibpactFfi012 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.2/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "a5bc30aa8fb09361fbbe3818c19f53111c7f0f2d3dd480939f9ebe5e0ae4471b"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.2/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "46137782052433226f81f7178c88d1ff0811635fd899ef7b280fc16e5647faa1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.2/libpact_ffi-linux-x86_64.so.gz"
      sha256 "bc50bddaca0a1d2289302fdbe5e7e7ef574dddddd59bf139b1ace7f5f5164056"
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
