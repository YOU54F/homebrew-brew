class LibpactFfi0313 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.13"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.13/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "51b125f4dd0e6fd819bae26be0286ae6c618d3b3aa097c63562bba8114ce7295"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.13/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "b86a54f3320fd6a8a2c16974ddb291b7b0f445a2af53aadc565174421ec2a2f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.13/libpact_ffi-linux-aarch64.so.gz"
      sha256 "375930495fb24b3d8fec4712dfa2517ce4eb3cf9e403fa2e11dca68051f546ff"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.13/libpact_ffi-linux-x86_64.so.gz"
      sha256 "9ecfc09fabefe42fd257f37c1973edd2aa8ad0101843aadad3ac3db0df08a04b"
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
