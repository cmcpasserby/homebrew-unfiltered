class UnityLoader < Formula
  desc "Tool for loading unity projects with their respective unity versions"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "525dc0a034de7d28f5983a5cedc928f384e978e93af6373034e63ba009c3fae3"

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
