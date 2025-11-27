class Plotjuggler < Formula
  desc "Time Series Visualization Tool"
  homepage "https://www.plotjuggler.io"
  url "https://github.com/facontidavide/PlotJuggler/archive/refs/tags/3.14.1.tar.gz"
  sha256 "24f31eec68fde84280d6b41b1a74070ee4c536183ddb4ff8e9f800f81c1436f2"
  license "MPL-2.0"
  head "https://github.com/facontidavide/PlotJuggler.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "mosquitto"
  depends_on "protobuf"
  depends_on "qt@5"
  depends_on "zeromq"

  def install
    args = %W[
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DCMAKE_DISABLE_FIND_PACKAGE_Arrow=ON
    ]

    # Set Qt5 and ZeroMQ paths
    ENV["CMAKE_PREFIX_PATH"] = "#{Formula["qt@5"].opt_prefix}:#{Formula["zeromq"].opt_prefix}"
    ENV["LDFLAGS"] = "-L#{Formula["zeromq"].opt_lib}"
    ENV["CPPFLAGS"] = "-I#{Formula["zeromq"].opt_include}"
    ENV["LIBRARY_PATH"] = Formula["zeromq"].opt_lib.to_s
    ENV["CPATH"] = Formula["zeromq"].opt_include.to_s

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"

    # Manual install since cmake --install seems to fail
    bin.install "build/bin/plotjuggler"
    bin.install Dir["build/bin/*.dylib"]

    # install desktop files
    (share/"applications").install "PlotJuggler.desktop" if File.exist?("PlotJuggler.desktop")
    (share/"icons").install "PlotJuggler.svg" if File.exist?("plotjuggler.svg")
  end

  test do
    # PlotJuggler is a GUI app, just check it launches
    assert_match version.to_s, shell_output("#{bin}/plotjuggler --version 2>&1", 1)
  end
end
