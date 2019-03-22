class UnityLoader < Formula
  desc "Tools for running and installing multiple versions of Unity"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/v2.0.1.tar.gz"
  sha256 "a0628ec0b27e8fa287a42261c8b41dd70089b109bf4823b05598046afc02edbb"

  depends_on "go" => :build

  def install
    bin_path = buildpath/"unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-mod=vendor" "-o", bin/"unity-loader", "./cmd/unity-loader/main.go"
    end
  end

  test do
    system "false"
    # system "#{bin}/unity-loader", '--help'
  end
end
