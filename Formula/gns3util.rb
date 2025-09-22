class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"

  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.0/gns3util-darwin-arm64.tar.gz"
    sha256 "46c37c9bbb869ae9c1d352523be835b12209095ea669da30521d4b3a8b89c09a"
  else
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.0/gns3util-darwin-amd64.tar.gz"
    sha256 "f0eaac262d8e417ca4c8716a6f3a9ba2c59798cca591c40236a83e51d4dd73d1"
  end

  version "1.1.0"
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
