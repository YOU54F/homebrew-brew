class LibpactFfi011 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.1/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "ea69af66f2c5f2a0425d5ea8b6284b7ed70b3c3dff18d75efbc85898d2377508"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.1/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "df8757e29015723cae6b25b2b0e3a322ff859a7c38bbb5d7b113ad444b276ac8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.1/libpact_ffi-linux-x86_64.so.gz"
      sha256 "78cbfc5a1234b29bb754011b0b702d14c8920d097c1d500b1f8359b9db8daf50"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
