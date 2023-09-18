# typed: false
# frozen_string_literal: true
class Containerd < Formula
  desc "An open and reliable container runtime."
  homepage "https://github.com/macOScontainers/containerd"
  version "0.0.1"
  license "Apache-2.0"
  url "https://github.com/macOScontainers/containerd/archive/refs/heads/macos.zip"
  sha256 "61177504d212d8f1e469272bf6a36a2998550f0565571668e5a0acca13cdf943"
  depends_on :macos
  depends_on "go" => :build
  depends_on "go-md2man" => :build
  depends_on "gpgme"

  def install
    system "go", "build", "-o", "bin/", "cmd/containerd/main.go"
    bin.install "bin/main" => "containerd"
    system "go", "build", "-o", "bin/", "cmd/ctr/main.go"
    bin.install "bin/main" => "ctr"
  end

  service do
    run [bin/"containerd"]
    require_root true
    keep_alive always: true
    working_dir HOMEBREW_PREFIX
    environment_variables PATH: std_service_path_env
  end

  def caveats
    <<~EOS
      See the GitHub repository for more information
    EOS
  end
end
