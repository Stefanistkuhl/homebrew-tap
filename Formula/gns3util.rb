class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  version "1.2.5"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.5/gns3util-darwin-arm64.tar.gz"
      sha256 "8f5c76ccd7e34fc30923d69c78f1cd3255e28b1694b7d497e3b4dfff3232e453"
    end
    on_intel do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.5/gns3util-darwin-amd64.tar.gz"
      sha256 "dcd4f10ddcb50a6892f28e7fbf34211c37ead1f1c911bc688c622fb44d3103e7"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    # After extraction, install the single binary regardless of name
    bin_name = Dir["gns3util*"].find { |f| File.file?(f) && File.executable?(f) } ||
               Dir["gns3util*"].first
    odie "binary not found in archive" unless bin_name
    chmod 0755, bin_name
    bin.install bin_name => "gns3util"
  end

  test do
    assert_match "gns3util", shell_output("#{bin}/gns3util --version")
  end
end
