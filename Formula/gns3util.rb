class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  version "1.2.4"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.4/gns3util-darwin-arm64.tar.gz"
      sha256 "4c76a0e54e0994bf384edd276cbcc765588f9a043cd61cba3c32dcde641c4218"
    end
    on_intel do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.4/gns3util-darwin-amd64.tar.gz"
      sha256 "aa0b42028bd39236206a113250e7bcb65937d19c2a694d5bf4348888dc166fe0"
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
