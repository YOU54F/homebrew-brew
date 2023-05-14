class LibpactFfi039 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.9"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.9/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "660d72711eb989a03112de34d0e1eec3d5578721fe2d2edfec1cbf7bea2c6088"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.9/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "ead06b38d2e6071c338b5fcaeaf5ca212c3af986f355e113579e9c161dfd5047"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.9/libpact_ffi-linux-aarch64.so.gz"
      sha256 "2378cdd2539f09a149ddebd84996b454d9775af06feaaec47bf04ccd700dbf3f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.9/libpact_ffi-linux-x86_64.so.gz"
      sha256 "8342fff3d13dcf858ba5b85a2f1cfc7e3b35eec293e842c486d2349119042606"
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
