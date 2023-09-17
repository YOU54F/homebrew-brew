# typed: false
# frozen_string_literal: true

class Tart < Formula
  desc "Run macOS VMs on Arm64 & and Linux VMs on Arm64/Intel"
  homepage "https://github.com/you54f/tart"
  version "1.12.1"
  license "Fair Source"

  depends_on "go" => :build
  depends_on "go-md2man" => :build
  depends_on "gpgme"

  depends_on "cirruslabs/cli/softnet"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cirruslabs/tart/archive/refs/heads/main.zip"
      sha256 "3e0852f9831ff90108a329e0bb7e375290e3b8db2ab8d3e72df494d4cdb62d1f"

      def install
        system "swift build --product tart --configuration release --disable-sandbox"
        system "codesign --sign - --entitlements Resources/tart-prod.entitlements --force .build/release/tart"
        bin.install ".build/release/tart" => "tart"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/darren/tart/archive/refs/heads/x86.zip"
      sha256 "61177504d212d8f1e469272bf6a36a2998550f0565571668e5a0acca13cdf943"
      def install
        system "swift build --product tart --configuration release --disable-sandbox"
        system "codesign --sign - --entitlements Resources/tart-prod.entitlements --force .build/release/tart"
        bin.install ".build/release/tart" => "tart"
      end
    end
  end

  def caveats
    <<~EOS
      See the GitHub repository for more information
    EOS
  end
end
