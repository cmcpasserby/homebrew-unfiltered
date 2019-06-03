class Ucb < Formula
  desc "Tools for working with Unity Cloud Build"
  homepage "https://github.com/cmcpasserby/ucb"
  url "https://github.com/cmcpasserby/ucb/archive/v1.0.3.tar.gz"
  sha256 "fa4963d187fee9d7429f3fdd6b6e8e25cf6867e37c3b73864803dfc1a5dcf4f1"

  depends_on "go" => :build

  def install
    bin_path = buildpath/"ucb"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "mod", "vendor"
      system "go", "build", "-mod=vendor", "-o", bin/"ucb", "./cmd/cloudbuild/main.go"
    end
  end

  test do
    system "false"
  end
end
