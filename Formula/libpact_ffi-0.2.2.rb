class LibpactFfi022 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.2/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "823872d467d81c8cdd4fe77cfb157bec14ca28039bd77b1e7359dde4dcda2ebc"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.2/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "2ef15f9cae6ad89d97f5aff252bc4b2cd62c39c0c5a2a3f36244427928453da3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.2/libpact_ffi-linux-x86_64.so.gz"
      sha256 "6836ef6a9acacdd2c164c82531791c476c01986bcccf0867cd4a5bf65e473def"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
