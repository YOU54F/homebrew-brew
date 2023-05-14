class LibpactFfi037 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.7"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.7/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "000be0ff906cfbe1fe2e78bae87b3907d70612df0c38a10ee85de213390dcbe7"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.7/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "500af30065ec12cd72bdabba5508ede19e4740debf1b2ca99f8472437a663b09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.7/libpact_ffi-linux-aarch64.so.gz"
      sha256 "f19725701ef0779e7f171eab78edf4c1dbdec0c3c2ac70683505f40f4f929e54"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.7/libpact_ffi-linux-x86_64.so.gz"
      sha256 "05b4a63f55c8ff0b41e00722a2ecc73278a9db0c847ebfe55afda8e16ebf7e73"
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
