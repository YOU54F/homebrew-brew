class LibpactFfi023 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.3/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "223f23b115438a7d16e4d0c9ed3a39d6bf2eb1a6550998a651ec35205446b4ae"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.3/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "a4fdabc9115be1035155b6315ffbe5ba95eb1d1fec7e7467347b00a3f7705c96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.3/libpact_ffi-linux-x86_64.so.gz"
      sha256 "1ce6f70b788d1fa45c8be4d1da95517c61a9051e100d1b2e0153b167237d8d01"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
