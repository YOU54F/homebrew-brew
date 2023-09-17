# typed: false
# frozen_string_literal: true
class Rund < Formula
  desc "rund is an experimental containerd shim for running macOS containers on macOS."
  homepage "https://github.com/macOScontainers/rund"
  version "0.0.1"
  license "Apache-2.0"
  url "https://github.com/macOScontainers/rund/archive/refs/heads/main.zip"
  sha256 "e75a80bdffb91764556e6795c09096553a20640061e996169e4b36b16aaf7b4f"
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
