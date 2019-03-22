class GitIssue < Formula
  desc "Git-based decentralized issue management"
  homepage "https://github.com/dspinellis/git-issue"
  url "https://github.com/dspinellis/git-issue/archive/adc675c8ff0a54c950416b0b2f5a8c240d3a4057.tar.gz"
  version "20190306-1"
  sha256 "e1c024ad26e6b1a07e7ada8c27b7ad8cf5c86796885294afbb0c3416b6b467b9"
  head "https://github.com/dspinellis/git-issue.git"

  depends_on "jq"

  def install
    system "make", "PREFIX=#{prefix}", "install"
    prefix.install_metafiles
  end

  test do
    system "git", "issue", "help"
  end
end
