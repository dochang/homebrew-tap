class Gobin < Formula
  desc "An experimental, module-aware command to install/run main packages"
  homepage "https://github.com/myitcv/gobin"
  url "https://github.com/myitcv/gobin/archive/v0.0.4.tar.gz"
  sha256 "1b027beae8e82f9c59a2f508f36901b94a8165918e15dd3b088e994d616c5d4b"
  head "https://github.com/myitcv/gobin.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "off"

    (buildpath/"src/github.com/myitcv/gobin").install buildpath.children
    cd "src/github.com/myitcv/gobin" do
      system "go", "build", "-o", bin/"gobin"
      prefix.install_metafiles
    end
  end

  test do
    system "false"
  end
end
