class UnityLoader < Formula
  desc "Tools for running and installing multiple versions of Unity"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/v0.0.7.tar.gz"
  sha256 "3c4f7a5516414753cd4b00104541bfef26b6fa314d8cb3b49b95c00b9405e281"

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/cmcpasserby/unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "dep", "ensure", "--vendor-only"
      system "go", "build", "-o", bin/"unity-loader", "./cmd/unity-loader/"
    end
  end

  test do
    system "false"
    # system "#{bin}/unity-loader", '--help'
  end
end
