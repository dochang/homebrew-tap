class Godef < Formula
  desc "Print where symbols are defined in Go source code"
  homepage "https://github.com/rogpeppe/godef"
  url "https://github.com/rogpeppe/godef/archive/v1.0.0.tar.gz"
  sha256 "3a019f377aa48233c25266eb9c223723b1ae79c657255c8fc90afc37f972e0da"
  head "https://github.com/rogpeppe/godef.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"

    system "go", "build", "-o", bin/"godef"
    prefix.install_metafiles
  end

  test do
    system "false"
  end
end
