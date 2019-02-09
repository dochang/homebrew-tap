class Kcov < Formula
  desc "Code coverage tool for compiled programs, Python and Bash"
  homepage "https://github.com/SimonKagstrom/kcov"
  url "https://github.com/SimonKagstrom/kcov/archive/v36.tar.gz"
  sha256 "29ccdde3bd44f14e0d7c88d709e1e5ff9b448e735538ae45ee08b73c19a2ea0b"
  head "https://github.com/SimonKagstrom/kcov.git"

  depends_on "cmake" => :build
  depends_on "curl"
  depends_on "zlib"
  depends_on "elfutils"
  depends_on "binutils" => :optional

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system bin/"kcov", "--version"
  end
end
