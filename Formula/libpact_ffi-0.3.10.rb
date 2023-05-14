class LibpactFfi0310 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.10"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.10/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "5892bc1c4becf6ec2636e0a42c1cfe6e31c7b258f83147e2e363b7b56f33bc8e"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.10/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "f2d2646b62e75eca76576d0a1d685e958c4422f834977a89a1d46ce185e3bb0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.10/libpact_ffi-linux-aarch64.so.gz"
      sha256 "7e8eca012e7d8806e16047b8328a0cfc4d107e4041d0ad02777aa0c53da27307"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.10/libpact_ffi-linux-x86_64.so.gz"
      sha256 "9b91bf82458549cdbab0e93a3d1be316a0e8a7c34aab2c7d40b07c2226601ea7"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
