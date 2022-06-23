class UnityLoader < Formula
  desc "Tool for loading unity projects with their respective unity versions"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "be9d6420cd546388f70093a14a6d77817e9cf76c9ea039dc169184b3906d46cc"

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
