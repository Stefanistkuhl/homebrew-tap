class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"

  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.2/gns3util-darwin-arm64.tar.gz"
    sha256 "6f5e43024dacc95e256409da785007d4ae842673afbd3712b02bd75f167e6ebc"
  else
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.2/gns3util-darwin-amd64.tar.gz"
    sha256 "8a91129d7875885a929a594667a314e64f38edca678da8016bf299ebc042671b"
  end

  version "1.1.2"
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
