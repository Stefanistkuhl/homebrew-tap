class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"

  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.0/gns3util-darwin-arm64.tar.gz"
    sha256 "51f94924f9f7c489bcedaa1fe514fb823c9e91e02718d018c3d57c63e20c52a4"
  else
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.0/gns3util-darwin-amd64.tar.gz"
    sha256 "99a20203561a071600a48383c5b42affe6df6a17f80a1b276fc5ca438c342db6"
  end

  version "1.0.0"
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
