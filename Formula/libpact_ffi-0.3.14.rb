class LibpactFfi0314 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.14"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.14/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "692d03b181dc5f24ce2589c21271ca431c22ba871128761ba3955ed62e034399"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.14/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "8f6ab62ae1bb613c1df1477cc19741aba1e67812147e3f539f1c752860c78dde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.14/libpact_ffi-linux-aarch64.so.gz"
      sha256 "942e5bbdf13b764350af794a926a3a7b517c535d692e8c0312f6fee960bff76a"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.14/libpact_ffi-linux-x86_64.so.gz"
      sha256 "a24de12b1a668ab9f5febbeeaa565f9ae7ad1b99c18b66d01ee04a874ab940d5"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
