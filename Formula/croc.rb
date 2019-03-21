class Croc < Formula
  desc "Easily and securely send things from one computer to another"
  homepage "https://schollz.com/software/croc/"
  url "https://github.com/schollz/croc/archive/v4.1.5.tar.gz"
  sha256 "a44cbe6d632f5962c7228ee61a852b5f156a3a43011eeaf8a8cd7c1aa482e2e5"
  head "https://github.com/schollz/croc.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = "#{HOMEBREW_CACHE}/go_cache"

    system "go", "build", "-o", "#{bin}/croc", "-ldflags", "-s -w -X main.Version=v#{version}"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/croc", "--version"
  end
end
