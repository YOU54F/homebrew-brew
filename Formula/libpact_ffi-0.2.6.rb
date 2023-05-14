class LibpactFfi026 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.6/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "5223a71d819b3d216e05eadc034093eafa65e15a88d5437d5a13f333d35b6503"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.6/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "18ee291b0d16f74313a0188f6cc7ff9bc4684c37f36eab9eae7bb0ca246b8f94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.2.6/libpact_ffi-linux-x86_64.so.gz"
      sha256 "20296d6e496bf4198612ebf8e6d7c6f93e6c5080bd0ca2542f2f885f0593fdd9"
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
