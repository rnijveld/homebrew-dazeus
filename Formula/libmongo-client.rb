require "formula"

class LibmongoClient < Formula
  homepage "https://github.com/algernon/libmongo-client"
  url "https://github.com/algernon/libmongo-client/archive/libmongo-client-0.1.7.tar.gz"
  sha1 "5981aeaa9466a7db53be9a8ef9868ece1ff4a893"

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
