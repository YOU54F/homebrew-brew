# typed: false
# frozen_string_literal: true

class Saffus < Formula
  desc "CLI for running Cirrus Tasks locally in Docker containers and Virtual Machines"
  homepage "https://github.com/you54f/cirrus-cli"
  version "0.98.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/you54f/cirrus-cli/releases/download/v0.98.0/saffus-darwin-amd64"
      sha256 "eaad343a9a14598217b821a8c1eb9cbbdeb82bf071a482b9ef5f7046de306d04"

      def install
        bin.install "saffus-darwin-amd64" => "saffus"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/you54f/cirrus-cli/releases/download/v0.98.0/saffus-darwin-arm64"
      sha256 "6ecfa6198d197c7f47268826e5fc2e3f6d54e82e2e4f0c926125397fb5fb9cd6"

      def install
        bin.install "saffus-darwin-arm64" => "saffus"
      end
    end
  end

  def caveats
    <<~EOS
      See the Github repository for more information
    EOS
  end
end
