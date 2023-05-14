class LibpactFfi014 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.4/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "44228bce7a2eb50f744578977e49c7fbf39d6fb4e141c53002cd06e47bc86fe0"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.4/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "c44a0f210b72b1e90dcbe42e367616441f06c8fdd7abf033b9f6dc68d9ad50b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.1.4/libpact_ffi-linux-x86_64.so.gz"
      sha256 "da9af09beb9e6a8aaf4fb8536a0c0a34f61681927f33de9d1c9d5629d418bd48"
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
