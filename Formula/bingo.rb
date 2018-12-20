class Bingo < Formula
  desc "Go language server that speaks Language Server Protocol"
  homepage "https://github.com/saibing/bingo"
  url "https://github.com/saibing/bingo/archive/v1.1.0.tar.gz"
  sha256 "4aa7fedca55c636b014b8127ae1c5277521b8a27acbc3eedc2eef7e92bb1273f"
  head "https://github.com/saibing/bingo.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"

    system "go", "build", "-o", bin/"bingo"
    prefix.install_metafiles
  end

  test do
    system bin/"bingo", "-version"
  end
end
