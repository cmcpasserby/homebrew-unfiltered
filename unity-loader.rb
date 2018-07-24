class UnityLoader < Formula
  desc 'Tools for running and installing multiple versions of Unity'
  homepage 'https://github.com/cmcpasserby/unity-loader'
  url 'https://github.com/cmcpasserby/unity-loader/archive/v0.0.1.tar.gz'
  sha256 'd9c00456b42d46cc2a4f5b6dc7f52246886cdcf5a475f699bf2001d1d3a99876'

  depends_on 'go' => :build
  depends_on 'dep' => :build

  def install
    ENV['GOPATH'] = buildpath
    bin_path = buildpath/"src/github.com/cmcpasserby/unity-loader"
    bin_path.install Dir["*"]
    cd bin_path do
      system "dep", "ensure"
      system "ls"
      system "go", "build", "-o", bin/"unity-loader", "./cmd/unity-loader/main.go"
    end
  end

  test do
    system "false"
    # system "#{bin}/unity-loader", '--help'
  end
end
