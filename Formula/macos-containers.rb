# typed: false
# frozen_string_literal: true

class MacosContainers < Formula
  desc "OCI containers on macOS"
  homepage "https://github.com/macOScontainers"
  version "0.0.1"
  depends_on "you54f/brew/bindfs"
  depends_on "you54f/brew/containerd"
  depends_on "you54f/brew/rund"
  depends_on "you54f/brew/buildkit"
  depends_on :macos

  on_macos do
    url "https://github.com/macOScontainers/rund/archive/refs/heads/main.zip"
    # sha256 "e75a80bdffb91764556e6795c09096553a20640061e996169e4b36b16aaf7b4f"
    puts "macOS Containers installed successfully!"
    def install
      doc.install Dir["readme.adoc"]
    end
  end

  def caveats
    <<~EOS
    See the repostiory for usage instructions
    
    # List images
    sudo ctr images ls

    # Pull images

    sudo ctr pull ghcr.io/macoscontainers/macos-jail/bigsur:latest
    sudo ctr pull ghcr.io/macoscontainers/macos-jail/monterey:latest
    sudo ctr pull ghcr.io/macoscontainers/macos-jail/ventura:latest


    # Shell into a container
    ctr run --rm -t --runtime $(which containerd-shim-rund-v1) ghcr.io/macoscontainers/macos-jail/ventura:latest my_container /bin/sh

    # point buildkit at containerd worker
    sudo mkdir -p /etc/buildkit
    sudo echo '[worker.containerd]
    runtime = "$(which containerd-shim-rund-v1)"'>/etc/buildkit/buildkitd.toml

    # Create Dockerfile
    cat << EOF > Dockerfile
    FROM ghcr.io/macoscontainers/macos-jail/ventura:latest
    RUN echo "Hello, World!"
    EOF

    # Aaaaad, build your first macOS image
    sudo buildctl build --frontend=dockerfile.v0 --local context=. -local dockerfile=.


    # Notes on pulling from registries
    cat ~/.config/containers/registries.conf
      unqualified-search-registries = ['registry.fedoraproject.org', 'registry.access.redhat.com', 'registry.centos.org', 'docker.io']
    
    # Notes on docker creds
    cat ~/.docker/config.json
    EOS
  end
end
