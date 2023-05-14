class LibpactFfi0319 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.19"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.19/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "1a5c47af6ca0066497ea6b11590a59372884e33d00095ac3ed0ed252c888a1c6"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.19/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "7b5ce5105c46087f2111c9c6d62740d1c80e844f747041bedabd04ac9836bde2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.19/libpact_ffi-linux-aarch64.so.gz"
      sha256 "eaf64ece6de6e2779f9e1b541e409996f6f3eb35abcb173d333a28b9ff96f1f7"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.19/libpact_ffi-linux-x86_64.so.gz"
      sha256 "c166b1fe1ad7c4dece510179b27686d9d0c81b45651f13fb6b00a8075c412ae4"
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
