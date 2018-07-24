class UnityLoader < Formula
  desc 'Tools for running and installing multiple versions of Unity'
  homepage 'https://github.com/cmcpasserby/unity-loader'
  url 'https://github.com/cmcpasserby/unity-loader/archive/0.0.2.tar.gz'
  sha256 'ce1f74e0710fbade92c9450a723a6381ab26dfe7993910910487ace72bab15bb'

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
