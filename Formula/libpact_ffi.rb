class LibpactFfi < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.4.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.4/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "d9263847c263b3c31edf67c4322ea566142addbabb45e50449008e893c328b00"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.4/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "0dcc1c5f42c36dcd38d7f3a37d21baafb050b32a90a0d4215d94a8c99139d939"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.4/libpact_ffi-linux-aarch64.so.gz"
      sha256 "81a48565b9333dd69851ceebdc71b8cba60c33458e663ceadeddc428f6654f62"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.4/libpact_ffi-linux-x86_64.so.gz"
      sha256 "81b4381c52a6da5b479ca031c4f057bc7e24ab91e10b930bab1b09032d836591"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}
";exec "ls #{bin}" 
  end

  test do
    system "#{bin}/libpact_ffi", "help"
  end
end
