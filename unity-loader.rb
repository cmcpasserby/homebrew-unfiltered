class UnityLoader < Formula
  desc "Tools for running and installing multiple versions of Unity"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/v2.0.2.tar.gz"
  sha256 "29e8d9ca69dff114f2d0fcc061f21f77cedaebb669d4fd4cc0fa82613a0d19ba"

  depends_on "go" => :build

  def install
    bin_path = buildpath/"unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "mod", "vendor"
      system "go", "build", "-mod=vendor", "-o", bin/"unity-loader", "./cmd/unity-loader/main.go"
    end
  end

  test do
    system "false"
    # system "#{bin}/unity-loader", '--help'
  end
end
