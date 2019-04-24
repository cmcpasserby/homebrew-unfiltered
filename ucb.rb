class Ucb < Formula
  desc "Tools for working with Unity Cloud Build"
  homepage "https://github.com/cmcpasserby/ucb"
  url "https://github.com/cmcpasserby/ucb/archive/v1.0.2.tar.gz"
  sha256 "9bdb0340916732c2df1bd28360f4e4427d091af8a4a0482fb8af69cb9b782fed"

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
