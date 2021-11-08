class UnityLoader < Formula
  desc "Tool for loading unity projects with their respective unity versions"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "f3b11157c36a004baa997888e341cf16ef8cd19b06bc27e7e401ea3b9108fbdc"

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
