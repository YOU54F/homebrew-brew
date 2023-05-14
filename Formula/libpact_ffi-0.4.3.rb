class LibpactFfi043 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.3/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "5e4369aa7767ebc453da52b0361c9b5a94089f6d8e8b16ec1206ff88ffc5e690"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.3/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "46d70e422c7f49b851de4121f7a15c296171b7e3fd8ec2be4f4e1fa8d374e077"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.3/libpact_ffi-linux-aarch64.so.gz"
      sha256 "11f8fce1c8bf9bccc924098ae6aa52b17a42e5b2f85321a15970fd81c2e5f4e3"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.3/libpact_ffi-linux-x86_64.so.gz"
      sha256 "30f52f5158803c02257bcb07db1e18ca5ddd39c418c6ca6ecf15674c86d7a165"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
