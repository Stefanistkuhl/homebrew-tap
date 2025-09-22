class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"

  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.1/gns3util-darwin-arm64.tar.gz"
    sha256 "1b3f619935fc139258088c8ff0952e0b4bf8913a21d0ea377c888d5abfdebf14"
  else
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.1/gns3util-darwin-amd64.tar.gz"
    sha256 "fe9da6e37ad61fe9bb8006f49d2ebd23877aff7490febdc3588757ba10ac2631"
  end

  version "1.1.1"
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
