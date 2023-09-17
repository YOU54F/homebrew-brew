# typed: false
# frozen_string_literal: true
class Rund < Formula
  desc "rund is an experimental containerd shim for running macOS containers on macOS."
  homepage "https://github.com/macOScontainers/rund"
  version "0.0.1"
  license "Apache-2.0"
  url "https://github.com/macOScontainers/rund/archive/refs/heads/main.zip"
  sha256 "6bf5db60f2237e3a38d66a6a3cb82f6d800980cf8558a6b0460d35aa5de557c7"
  depends_on :macos
  depends_on "go" => :build
  depends_on "go-md2man" => :build
  depends_on "gpgme"

  def install
    system "go", "build", "-o", "bin/", "cmd/containerd-shim-rund-v1.go"
    bin.install "bin/containerd-shim-rund-v1" => "containerd-shim-rund-v1"
  end

  def caveats
    <<~EOS
      See the GitHub repository for more information
    EOS
  end
end
