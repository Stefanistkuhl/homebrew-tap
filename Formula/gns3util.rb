class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"

  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.4/gns3util-darwin-arm64.tar.gz"
    sha256 "4d77d5da93fe581da27cf3357354efd105fe0c21c1d78de08922e14d456d7384"
  else
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.4/gns3util-darwin-amd64.tar.gz"
    sha256 "8163e19a2df0b489366ef88f904abed320c7eebd2e9ae39ae1209d0a4f6d60a7"
  end

  version "1.1.4"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    binary = Hardware::CPU.arm? ? "gns3util-darwin-arm64" : "gns3util-darwin-amd64"
    bin.install binary => "gns3util"
  end

  test do
    assert_match "gns3util", shell_output("#{bin}/gns3util --version")
  end
end
