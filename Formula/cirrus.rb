# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Cirrus < Formula
  desc "CLI for running Cirrus Tasks locally in Docker containers"
  homepage "https://github.com/cirruslabs/cirrus-cli"
  version "0.103.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cirruslabs/cirrus-cli/releases/download/v0.103.1/cirrus-darwin-amd64.tar.gz"
      sha256 "70bbaa0b9080183285c3183f177420a0ebca9dcf9cb34ceb8088fa6bdefa2d7f"

      def install
        bin.install "cirrus"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cirruslabs/cirrus-cli/releases/download/v0.103.1/cirrus-darwin-arm64.tar.gz"
      sha256 "aa723074ba3d6ffb91b3767c5ad221f2088035c66e08df5cf3c7bfee6fff355d"

      def install
        bin.install "cirrus"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/cirruslabs/cirrus-cli/releases/download/v0.103.1/cirrus-linux-arm.tar.gz"
      sha256 "675ca46cdaef786a9137fa5f6917b52e45181390fc56301774c8ac48de4fe5e9"

      def install
        bin.install "cirrus"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/cirruslabs/cirrus-cli/releases/download/v0.103.1/cirrus-linux-amd64.tar.gz"
      sha256 "ead72cc7ac250548fb655ca379383cfbd6d6fab45cf7fd498504dd0874b0a0fd"

      def install
        bin.install "cirrus"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cirruslabs/cirrus-cli/releases/download/v0.103.1/cirrus-linux-arm64.tar.gz"
      sha256 "7277ec7880aa9c720cc826c120fa5c49803a2c8aa111484b9a7a3df7a8438958"

      def install
        bin.install "cirrus"
      end
    end
  end

  def caveats
    <<~EOS
      See the Github repository for more information
    EOS
  end
end