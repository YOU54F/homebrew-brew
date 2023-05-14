class LibpactFfi000 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.0.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.0/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "aab041bf35bf89c9f5703892e5956add96bfe107fb1f8f72c70ae813aa398a93"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.0/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "aab041bf35bf89c9f5703892e5956add96bfe107fb1f8f72c70ae813aa398a93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.0/libpact_ffi-linux-x86_64.so.gz"
      sha256 "aac3cd99c2e9fcbb9a070fdd872abb395c0cd86c5fdf778d307f63253125e5f9"
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
