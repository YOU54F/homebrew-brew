class LibpactFfi031 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.1/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "990d45981be8ef889dc272c507b7ccaed2bcfb75754970ef8bc0477b8ba2d8ce"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.1/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "901f03c28fcb4806c2d8d41634050043bcb10ee7ae9b22351a275a526b886698"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.1/libpact_ffi-linux-x86_64.so.gz"
      sha256 "d74110ed77c8c73fcf8b6a6ffa2e1b51b20b27cfcc06f43236b4d7160a202847"
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
