class UnityLoader < Formula
  desc 'Tools for running and installing multiple versions of Unity'
  homepage 'https://github.com/cmcpasserby/unity-loader'
  url 'https://github.com/cmcpasserby/unity-loader/archive/v0.0.3.tar.gz'
  sha256 '966bd214c26233635c0510a09048e03539276ecdc3767748da036bab548393a1'

  depends_on 'go' => :build
  depends_on 'dep' => :build

  def install
    ENV['GOPATH'] = buildpath
    bin_path = buildpath/"src/github.com/cmcpasserby/unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "dep", "ensure"
      system "go", "build", "-o", bin/"unity-loader", "cmd/unity-loader/main.go"
    end
  end

  test do
    system "false"
    # system "#{bin}/unity-loader", '--help'
  end
end
