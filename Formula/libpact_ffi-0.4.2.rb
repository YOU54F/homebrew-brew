class LibpactFfi042 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.2/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "0e6c9bdadc8d09c01924dd93a3895d754af53a4fcee277cdea38327064540281"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.2/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "2276b2ad4ebadd90c8a14c0784c3ec40490b454644da4c05fb86ce9acbe01fb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.2/libpact_ffi-linux-aarch64.so.gz"
      sha256 "0ba56265932accdd59867cacae78f9422ce5193c7c11a743a682c01247546b55"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.2/libpact_ffi-linux-x86_64.so.gz"
      sha256 "e6657baddf0e0e6ef83f46312df459fa5e7c87b0e448d48fa9751dc151ee3eda"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
