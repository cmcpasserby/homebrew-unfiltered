class UnityLoader < Formula
  desc "Tool for loading unity projects with their respective unity versions"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "1db7c294a931a7f5282b0bd015d4d99690ffed0af4c8286ea5d37a92aee7280d"

  depends_on "go" => :build

  def install
    bin_path = buildpath/"unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "mod", "vendor"
      system "go", "build", "-mod=vendor", "-o", bin/"unity-loader", "./cmd/unity-loader"
    end
  end

  test do
    system "unity-loader", "--version"
  end
end
