class LibpactFfi025 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.5/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "4bb62f92c5eac110515d5f7e00510933b0cc590627bdc20b7b916d26238fb45d"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.5/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "4b8526803b5dd2ccfd80dffd7ffdaea57076d6bc0ae4b63e6c3444caeb51e421"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.5/libpact_ffi-linux-x86_64.so.gz"
      sha256 "7921bdc9a051bea0a4af89d377c2728c14f0516afddb48bc6aa91232ef11e609"
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
