class Croc < Formula
  desc "Easily and securely send things from one computer to another"
  homepage "https://schollz.com/software/croc/"
  url "https://github.com/schollz/croc/archive/v4.1.4.tar.gz"
  sha256 "0f81f22f6af478b0d499be4da19a38dff49aae2b9a4e1295f9949f15f185d863"
  head "https://github.com/schollz/croc.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", "-o", bin/"croc", "-ldflags", "-s -w -X main.Version=v#{version}"
    prefix.install_metafiles
  end

  test do
    system bin/"croc", "--version"
  end
end
