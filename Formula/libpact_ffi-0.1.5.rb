class LibpactFfi015 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.5/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "a23d32f488a92e60ef3a1ae54221cd28a9016943a3916e5c4753e02341fab307"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.5/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "34e67120c19a6446251f8b4b46ef0f0199bdb4e28946b1cb25ee3fed4f7a091a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.5/libpact_ffi-linux-x86_64.so.gz"
      sha256 "91eb9a53df70cc4dcc8cfeeb4f5c152f0bb1755474451595169ab24f93a74ebe"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
