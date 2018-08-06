class UnityLoader < Formula
  desc "Tools for running and installing multiple versions of Unity"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/v0.0.4.tar.gz"
  sha256 "f22c989c7380487ab457b7cb1a85222eda96ec4d691d0e6d04bd700188fabbed"

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
