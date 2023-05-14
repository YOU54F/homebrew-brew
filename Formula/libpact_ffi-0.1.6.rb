class LibpactFfi016 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.6/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "cd0597911c5c4fe65e08ef0de9199906e508d90867bb510430a4e99ae952daec"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.6/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "35eb961e764c373f72429ffbf55c64641af7574355d2a72d993e28d1eec446cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.6/libpact_ffi-linux-x86_64.so.gz"
      sha256 "bb645870d29c18f0500ff4bdbe6b79fe9e7110eeea927aeaa742146b2ee59d49"
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
