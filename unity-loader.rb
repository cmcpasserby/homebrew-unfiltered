class UnityLoader < Formula
  desc "Tools for running and installing multiple versions of Unity"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/v0.0.5.tar.gz"
  sha256 "6f8ead0dbbae77900e35dd6ba1b4ac814b526ca6aa202d61e3b93cbe2a4144cd"

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/cmcpasserby/unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "dep", "ensure", "--vendor-only"
      system "go", "build", "-o", bin/"unity-loader", "./cmd/unity-loader"
    end
  end

  test do
    system "false"
    # system "#{bin}/unity-loader", '--help'
  end
end
