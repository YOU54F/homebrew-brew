# typed: false
# frozen_string_literal: true

class GithubActRunner < Formula
  desc "act as self-hosted runner"
  homepage "https://github.com/ChristopherHX/github-act-runner"
  version "0.6.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ChristopherHX/github-act-runner/releases/download/v0.6.5/binary-darwin-amd64.tar.gz"
      sha256 "5f0794ef7a04bf2be3923cc448355aa2799ae533f334640e868988f873aefbd8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/ChristopherHX/github-act-runner/releases/download/v0.6.5/binary-darwin-arm64.tar.gz"
      sha256 "80b41c5bd745047c8f0b820cc235185ca7dd01aedd879ca69a36e07f47ed0dec"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ChristopherHX/github-act-runner/releases/download/v0.6.5/binary-linux-amd64.tar.gz"
      sha256 "19c66b24b82d1f3fd53e3df1f7830d57718088e15c33a45173d03ffd152cc6d7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/ChristopherHX/github-act-runner/releases/download/v0.6.5/binary-linux-arm64.tar.gz"
      sha256 "b162b1ec1c83347c79a5fda55de257ece0b5fcddff2d7f493e1013b44d16e4b2"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/github-act-runner"
  end

  def caveats
    <<~EOS
      See the Github repository for more information
    EOS
  end
end
