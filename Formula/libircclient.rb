require "formula"

class Libircclient < Formula
  homepage "http://sourceforge.net/projects/libircclient/"
  url "http://downloads.sourceforge.net/project/libircclient/libircclient/1.9/libircclient-1.9.tar.gz"
  sha256 "81c397eee618667bccfe8960352ba5f829c8c2e9badc270594b91128cd89c064"

  depends_on 'openssl'
  
  def patches; DATA; end

  def install
    system "./configure", "--disable-debug",
                          "--enable-openssl",
                          "--enable-ipv6",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install", "exec_prefix=#{prefix}"
  end
end

__END__
diff --git a/src/Makefile.in b/src/Makefile.in
--- a/src/Makefile.in	2014-02-13 22:23:40.000000000 +0100
+++ b/src/Makefile.in	2014-02-13 22:30:04.000000000 +0100
@@ -20,11 +20,10 @@ install:
 	-mkdir -p $(DESTDIR)@libdir@
 	cp ../include/libircclient.h $(DESTDIR)@prefix@/include/libircclient.h
 	cp ../include/libirc_errors.h $(DESTDIR)@prefix@/include/libirc_errors.h
-	cp ../include/libirc_events.h  $(DESTDIR)@prefix@/include/libirc_events.h 
-	cp ../include/libirc_options.h  $(DESTDIR)@prefix@/include/libirc_options.h 
-	cp ../include/libirc_rfcnumeric.h  $(DESTDIR)@prefix@/include/libirc_rfcnumeric.h 
-	cp libircclient.so $(DESTDIR)@libdir@/libircclient.so.$(APIVERSION)
-	ln -fs libircclient.so.$(APIVERSION) $(DESTDIR)@libdir@/libircclient.so
+	cp ../include/libirc_events.h  $(DESTDIR)@prefix@/include/libirc_events.h
+	cp ../include/libirc_options.h  $(DESTDIR)@prefix@/include/libirc_options.h
+	cp ../include/libirc_rfcnumeric.h  $(DESTDIR)@prefix@/include/libirc_rfcnumeric.h
+	cp libircclient.a $(DESTDIR)@libdir@/libircclient.a
 
 libircclient.so: libircclient.o
 	$(CC) -shared -s -Wl,-soname,libircclient.so.$(APIVERSION) -o libircclient.so libircclient.o @LIBS@
