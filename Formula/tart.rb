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

  depends_on "you54f/brew/softnet"
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
      sha256 "6ea7ac7d2d06bd79ea49b8b3f77f25b140038980ebf0115ec7bfcbc91e47e3b9"
      def install
        system "swift build --product tart --configuration release --disable-sandbox"
        system "codesign --sign - --entitlements Resources/tart-dev.entitlements --force .build/release/tart"
        lib.install "Resources/tart-dev.entitlements" => "tart-dev.entitlements"
        lib.install "Resources/tart-prod.entitlements" => "tart-prod.entitlements"
        bin.install ".build/release/tart" => "tart"
      end
    end
  end

  def caveats
    <<~EOS
      See the GitHub repository for more information
      app getting killed straight away? check your entitlements
      codesign --sign - --entitlements #{lib}/tart-dev.entitlements --force tart
      codesign --sign - --entitlements #{lib}/tart-prod.entitlements --force tart
    EOS
  end
end
