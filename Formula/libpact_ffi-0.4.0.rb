class LibpactFfi040 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.0/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "0a5ae15841082ddb090ac28d05784d5b1a81cf8a157a941bd8ccdd1e850aab08"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.0/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "7e26f024e38e114cd906e89a8b1e94c8a90ca0f15c77691acd72736e65b50a5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.0/libpact_ffi-linux-aarch64.so.gz"
      sha256 "28fc42dd50c1782ad08e4029fef521da9f27814feaf0987523bd5354f5fc8918"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.0/libpact_ffi-linux-x86_64.so.gz"
      sha256 "dd63e4b4f3af8f1a4cfe4a7954cc8992eeecc95ef21015a7e258c2cc91d34682"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
