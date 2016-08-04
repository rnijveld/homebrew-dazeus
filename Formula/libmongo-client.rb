require "formula"

class LibmongoClient < Formula
  homepage "https://github.com/algernon/libmongo-client"
  url "https://github.com/algernon/libmongo-client/archive/libmongo-client-0.1.7.tar.gz"
  sha256 "820d98d1ee06070aa51861d1583dd5b3556b6dbca6fecdc1c91eb3c18360d2d9"

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'glib'

  def install
    system "autoreconf", "-i"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
