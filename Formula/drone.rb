class Drone < Formula
  desc "Drone CLI"
  homepage "https://github.com/drone/drone-cli"
  url "https://github.com/drone/drone-cli/archive/v1.0.7.tar.gz"
  sha256 "8c2266dbe6a37d715287105fc0c741f4c5aa8e85b9389e7a4a85889f91dbe7c6"
  head "https://github.com/drone/drone-cli.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    ENV["GO111MODULE"] = "off"

    (buildpath / "src/github.com/drone/drone-cli").install buildpath.children
    cd "src/github.com/drone/drone-cli" do
      system "go", "build", "-o", "#{bin}/drone", "-ldflags", "-X main.version=#{version}", "./drone"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/drone", "--version"
  end
end
