class LibpactFfi010 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.0/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "018918b3bd9850e00b6799bcadaa3f108815205df2f6d6da23949c9fd15897fa"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.0/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "5417657438b6244cf350410bf88c676f663f623ce056b0965f5e2d6a37259e83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.0/libpact_ffi-linux-x86_64.so.gz"
      sha256 "0beddb4dea84fdc3d663737b8ba86b7053f4915412dfe8670f53ce8c586b3604"
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
