class Macosvm < Formula
  desc "Tool for running macOS guest virtual machines in macOS 12 host or higher on M1 arm64 Macs."
  homepage "https://github.com/s-u/macosvm"
  # url "https://github.com/s-u/macosvm/archive/refs/heads/main.zip"
  url "https://github.com/s-u/macosvm/releases/download/0.2-1/macosvm-0.2-1-arm64-darwin21.tar.gz"
  sha256 "3cc8c46ee2b5bd624d5310f28c6dc3de28c194b43ebbff1408f1d2e360e4d48d"
  version "0.2-1"
  head do
    url "https://github.com/s-u/macosvm.git", branch: "master"
  end

  def install
    if build.head?
      system "make"
      bin.install "macosvm/macosvm" => "macosvm"
    else
      bin.install "macosvm"
    end
  end

  test do
    system "macosvm", "--version"
  end
end
