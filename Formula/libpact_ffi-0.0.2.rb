class LibpactFfi002 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.0.2"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.2/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "7b779321f41241763bd6ec2ee6be857fd86ac2821b4ae655dfe1eb52fb5a331f"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.2/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "67674924153db597e15e9a0ba10822f9b84e8266c5ccb2967505d92067e81911"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.0.2/libpact_ffi-linux-x86_64.so.gz"
      sha256 "6a01da7f4950f877bc119ef90064bbc14c75e24ec56ab7810a5992f278e367c0"
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
