class Gops < Formula
  desc "A tool to list and diagnose Go processes currently running on your system"
  homepage "https://github.com/google/gops"
  url "https://github.com/google/gops/archive/v0.3.5.tar.gz"
  sha256 "683b6b78465c06e868e6b3cdf6c796f956e06981f40c7d6f9d17f9d67fe01716"
  head "https://github.com/google/gops.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/google/gops").install buildpath.children
    cd "src/github.com/google/gops" do
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-o", bin/"gops"
      prefix.install_metafiles
    end
  end

  test do
    system "false"
  end
end
