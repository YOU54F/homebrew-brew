class LibpactFfi0316 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.16"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.16/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "7d01e113959d8a65abedaa405b489eed53c6e0eeb3fef003e513a56169764e45"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.16/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "8d1fa8fbc5ced1da1cce0ad036c6c8cce2eda7bb8050e914f4349e89ac99fed7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.16/libpact_ffi-linux-aarch64.so.gz"
      sha256 "e2265e9124823fbd777891efe4c64de12dd73e0c8116f978010fb953ebebc56e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.16/libpact_ffi-linux-x86_64.so.gz"
      sha256 "f8e2d4a08a88a69269d80752d0ad3df4aaa75c1050d4d725bc2207234accea04"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
