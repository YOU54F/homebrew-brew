# typed: false
# frozen_string_literal: true

class Passh < Formula
  desc "enable automated password ssh logins - better sshpass"
  homepage "https://github.com/clarkwang/passh"
  version "1.0.2"
  url "https://github.com/clarkwang/passh/archive/refs/tags/v1.0.2.zip"
  sha256 "dece9ae5944375af7958a4d6cf2d1d98abffef0db7a7b068fbf50702dae45c72"
  def install
    system "cc -o passh passh.c"
    bin.install "passh"
  end

  def caveats
    <<~EOS
      See the Github repository for more information
    EOS
  end
end
