class Ucb < Formula
  desc "Tools for working with Unity Cloud Build"
  homepage "https://github.com/cmcpasserby/ucb"
  url "https://github.com/cmcpasserby/ucb/archive/v1.0.0.tar.gz"
  sha256 "d26acbeba5066924f7cbe41c35e5a3233f9495a899e779e820cd822ca70d397e"

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
