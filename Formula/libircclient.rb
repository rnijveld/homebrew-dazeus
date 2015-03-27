require "formula"

class Libircclient < Formula
  homepage "http://sourceforge.net/projects/libircclient/"
  url "http://downloads.sourceforge.net/project/libircclient/libircclient/1.8/libircclient-1.8.tar.gz"
  sha1 "dda7df9fd9239542d295759033d7b518f0b3efd9"

  depends_on 'openssl'

  def install
    system "./configure", "--disable-debug",
                          "--enable-openssl",
                          "--enable-ipv6",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install", "exec_prefix=#{prefix}"
  end
end
