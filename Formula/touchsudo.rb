class Touchsudo < Formula
  desc "Enable Touch ID for sudo authentication on macOS"
  homepage "https://github.com/kashyap07/homebrew-touchsudo"
  url "https://github.com/kashyap07/homebrew-touchsudo/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "05365cbf429fdbf78879f9377129181cbe9c9e8e46854c918972d1ba1494d239"
  license "MIT"
  head "https://github.com/kashyap07/homebrew-touchsudo.git", branch: "main"

  depends_on :macos

  def install
    bin.install "touchsudo"
  end

  def caveats
    <<~EOS
      To enable Touch ID for sudo, run:
        touchsudo enable

      To check status:
        touchsudo status
    EOS
  end

  test do
    system "#{bin}/touchsudo", "version"
  end
end
