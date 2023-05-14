class LibpactFfi035 < Formula
  desc "Pact FFI Library for MacOS / Linux"
  homepage "https://github.com/pact-foundation/pact-reference"
  version "0.3.5"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.5/libpact_ffi-osx-aarch64-apple-darwin.dylib.gz"
      sha256 "7207a846fde9180340d7166d8a9ad7cd33daf307116aa7937ae3d6ad41566e69"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.5/libpact_ffi-osx-x86_64.dylib.gz"
      sha256 "a3658590c437ad14fcea8ee44c71160e52496eb46757c2a7c787315f3d39eb72"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.3.5/libpact_ffi-linux-x86_64.so.gz"
      sha256 "2594a75a2b1b9b2c7d846183a5ea33e902b6eaf43ed15843b755a333562af189"
    end
  end

  def install
    # pact-reference libpact_ffi
    # https://github.com/pact-foundation/pact-reference
    bin.install Dir["*"]; puts "Binary location: #{bin}\n";exec "ls #{bin}"
  end
end
