class LibpactFfi020 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.0/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "e0d9860421602cd97ae179ab29793139f97ba469b7a74042cc42393d942a62ae"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.0/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "1efe3abf0a145347ba936a26870128287772121ca4ba48fbbf0914f31f93d88e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.0/libpact_ffi-linux-x86_64.so.gz"
      sha256 "b2d9b64ef0cb0aa436c9310992b0d8794cc0ecf92b9c9f373da37011408665c3"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
