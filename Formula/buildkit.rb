class Buildkit < Formula
    desc "Сoncurrent, cache-efficient, and Dockerfile-agnostic builder toolkit"
    homepage "https://github.com/moby/buildkit"
    url "https://github.com/macOScontainers/buildkit/archive/refs/heads/macos.zip"
    version "0.13.0"
    sha256 "3ad69e1d45a2e94e201678b94cbbd45b2032cfcbe14b2a1109c9c685da6cbafd"
    license "Apache-2.0"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", *std_go_args(output: bin/"buildkitd"), "./cmd/buildkitd"
      system "go", "build", *std_go_args(output: bin/"buildctl"), "./cmd/buildctl"
  
      doc.install Dir["docs/*.md"]
    end
  
    test do
      assert_match "make sure buildkitd is running",
        shell_output("#{bin}/buildctl --addr unix://dev/null --timeout 0 du 2>&1", 1)
  
      assert_match version.to_s, shell_output("#{bin}/buildctl --version")
    end
  end