# There are 3 variants:
#
#  1. https://github.com/uudashr/gopkgs
#  2. https://github.com/haya14busa/gopkgs
#  3. https://github.com/tpng/gopkgs
#
# We use 1 because it supports Go modules.

class Gopkgs < Formula
  desc "Tool to get list available Go packages"
  homepage "https://github.com/uudashr/gopkgs"
  url "https://github.com/uudashr/gopkgs/archive/v2.0.1.tar.gz"
  sha256 "37decc4d6a9a416a0ea61396b7d429ce4e18efe136a75213101bcd0ae97fa168"
  head "https://github.com/uudashr/gopkgs.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin

    (buildpath/"src/github.com/uudashr/gopkgs").install buildpath.children
    cd "src/github.com/uudashr/gopkgs" do
      system "make", "install", "DEP_OPTS=-vendor-only"
      prefix.install_metafiles
    end
  end

  test do
    system "false"
  end
end
