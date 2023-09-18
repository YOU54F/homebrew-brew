class Vmd < Formula
  desc "The vmd application from OpenBSD adjusted to work on macOS."
  homepage "https://github.com/ren-e/vmd"
  url "https://github.com/ren-e/vmd/archive/refs/heads/main.zip"
  sha256 "f29f70571957e1badf812c01aa2e802670e009266d9b0d2587a277ad9527187f"
  version "0.0.14"

  # depends_on "asciidoctor" => :build
  # depends_on "rust" => :build
  # # We depend on libkrun, which only supports Hypervisor.framework on arm64
  # depends_on arch: :arm64
  # depends_on "buildah"
  # depends_on "libkrun"

  def install
    system "make"
    bin.install "vmctl"
    puts "if using -c option, you may need to run:"
    puts "see https://github.com/ren-e/vmd#console-handling"
    puts "sudo chmod 775 /var/spool/uucp/"
    puts "sudo chgrp staff /var/spool/uucp/"
  end

  test do
    system "vmctl", "--version"
  end
end
