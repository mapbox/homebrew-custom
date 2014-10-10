require "formula"

class MapboxLibuv < Formula
  homepage "https://github.com/joyent/libuv"
  url "https://github.com/joyent/libuv/archive/v0.10.21.tar.gz"
  sha1 "883bb240d84e1db11b22b5b0dfdd117ed6bc6318"

  def install
    File.open('libuv.pc', 'w') {|f|
        f.write(<<-EOT
prefix=#{prefix}
exec_prefix=#{prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: libuv
Version: #{version}
Description: multi-platform support library with a focus on asynchronous I/O.

Libs: -L${libdir} -luv -lm -pthread -framework Foundation -framework CoreServices -framework ApplicationServices
Cflags: -I${includedir}
EOT
    )
    }

    system "make"
    prefix.install "include"
    (lib+'pkgconfig').install "libuv.pc"
    lib.install "libuv.a"
  end
end
