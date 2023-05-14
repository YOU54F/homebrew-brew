class LibpactFfi021 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.1/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "6a48ba5be78c74812018dfac311b48fc78c02c1c4f0d94815545486da85fa14f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.1/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "332221a3e2e579ea8cad02e5c2713319e62940a94e570a244ec65c357d0097dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.1/libpact_ffi-linux-x86_64.so.gz"
      sha256 "24f1027350fd74eebac28942401e2f45a181f8d8d8d583d24192ee92a2255ba5"
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
