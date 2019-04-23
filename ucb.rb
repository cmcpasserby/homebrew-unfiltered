class Ucb < Formula
  desc "Tools for working with Unity Cloud Build"
  homepage "https://github.com/cmcpasserby/ucb"
  url "https://github.com/cmcpasserby/ucb/archive/v1.0.1.tar.gz"
  sha256 "7bfb5f109c3915790244d86db81d3cf82cfba6269e8b4f548fe33473ce1c0f20"

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
