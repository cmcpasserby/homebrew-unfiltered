class UnityLoader < Formula
  desc "Tools for running and installing multiple versions of Unity"
  homepage "https://github.com/cmcpasserby/unity-loader"
  url "https://github.com/cmcpasserby/unity-loader/archive/v0.0.1.tar.gz"
  sha256 "d9c00456b42d46cc2a4f5b6dc7f52246886cdcf5a475f699bf2001d1d3a99876"

  depends_on "go" => :build

  def install
    system "gobuild.sh"
    bin.install ".gobuild/bin/unity-loader" => "unity-loader"
  end

  test do
    system "#{bin}/unity-loader", "--help"
  end
end
