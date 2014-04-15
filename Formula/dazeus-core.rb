require "formula"

class DazeusCore < Formula
  homepage "http://dazeus.org/"

  head 'https://github.com/dazeus/dazeus-core.git'

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'libircclient'
  depends_on 'libmongo-client'

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    bin.install 'src/dazeus'
  end
end
