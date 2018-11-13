# There are 2 variants:
#
#  1. https://github.com/cespare/deplist
#  2. https://github.com/markbates/deplist
#
# We use 1 because it requires less dependencies.

class Deplist < Formula
  desc "List the external dependencies of a Go package"
  homepage "https://github.com/cespare/deplist"
  url "https://github.com/cespare/deplist.git",
      :revision => "40cb3f1f42976e8e47b08c3ed245c9b7a4e0dc1b"
  version "0.0.0-20180910-40cb3f1f42976e8e47b08c3ed245c9b7a4e0dc1b"
  head "https://github.com/cespare/deplist.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"

    system "go", "build", "-o", bin/"deplist"
    prefix.install_metafiles
  end

  test do
    system "false"
  end
end
