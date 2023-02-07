class UnityLoader < Formula
  desc "Tool for loading unity projects with their respective unity versions"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "cd9eefceeb2b2c55cdc72ef03296c3b73f21474c9ca06d19a4b5a7090e2a1294"

  depends_on "go" => :build

  def install
    bin_path = buildpath/"unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"unity-loader", "./cmd/unity-loader"
    end
  end

  test do
    system "unity-loader", "-v"
  end
end
