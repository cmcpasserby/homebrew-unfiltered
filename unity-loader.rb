class UnityLoader < Formula
  desc "Tools for running and installing multiple versions of Unity"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/v2.0.3.tar.gz"
  sha256 "9346088e35da3f8c8962c89a0cb1ad47976db08cf1a23985628f6c3fad3e5ecb"

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
