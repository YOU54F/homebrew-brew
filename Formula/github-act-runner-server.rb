# typed: false
# frozen_string_literal: true

class GithubActRunnerServer < Formula
  desc "An unofficial Local GitHub Actions and Azure Pipelines Emulator"
  homepage "https://github.com/ChristopherHX/runner.server"
  version "3.11.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ChristopherHX/runner.server/releases/download/v3.11.7/runner.server-osx-x64.tar.gz"
      sha256 "6ff980c9b266e89b63d4efdc0e354c2a26d0dd443aa00c63bb135201587c43ee"
    end
    if Hardware::CPU.arm?
      url "https://github.com/ChristopherHX/runner.server/releases/download/v3.11.7/runner.server-osx-arm64.tar.gz"
      sha256 "c602c6ba99e7be3c499fd9599cf7ecf2b926bfda580d95dd3c38139561831b9c"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ChristopherHX/runner.server/releases/download/v3.11.7/runner.server-linux-x64.tar.gz"
      sha256 "dbcb5910b78bfd5c9b51f8e6e9e50ef2e77f2da19378a184ee68385baddf7148"
    end
    if Hardware::CPU.arm?
      url "https://github.com/ChristopherHX/runner.server/releases/download/v3.11.7/runner.server-linux-arm64.tar.gz"
      sha256 "270744517a58e64ef886dd78179dbbd425d5504a4967789abfed8ad1e3063c0f"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/Runner.Server" => "github-act-runner-server"
    bin.install_symlink "#{libexec}/Runner.Client" => "github-act-runner-client"
    bin.install_symlink "#{libexec}/Runner.Listener" => "github-act-runner-listener"
  end
  
  def caveats
    <<~EOS
      See the Github repository for more information
    EOS
  end
end
