class LibpactFfi034 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.4/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "87f42287e24fc21aa8b3226add8e0ffc42089127abd94d9cda7dddd8e34a6635"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.4/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "42e9d3dbd48b7ea6b3b3c60c287dfa520b3e7067e1e4e8a2be6433efb1f01acd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.4/libpact_ffi-linux-x86_64.so.gz"
      sha256 "4ac43d61eba3722d4aeb50d51563703721ae90240d72f511cf2e935249a31aa5"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
