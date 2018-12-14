class Gohack < Formula
  desc "Make temporary edits to your Go module dependencies"
  homepage "https://github.com/rogpeppe/gohack"
  url "https://github.com/rogpeppe/gohack/archive/v1.0.0.tar.gz"
  sha256 "c9b4b0fa1c3c994857fa09c2416b8b9d1f7807b119ec53e58830c78c7c7fe2fb"
  head "https://github.com/rogpeppe/gohack.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"

    system "go", "build", "-o", bin/"gohack"
    prefix.install_metafiles
  end

  test do
    system "false"
  end
end
