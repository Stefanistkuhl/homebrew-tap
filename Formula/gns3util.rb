class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  version "1.1.4"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.4/gns3util-darwin-arm64.tar.gz"
      sha256 "4d77d5da93fe581da27cf3357354efd105fe0c21c1d78de08922e14d456d7384"
    end
    on_intel do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.4/gns3util-darwin-amd64.tar.gz"
      sha256 "8163e19a2df0b489366ef88f904abed320c7eebd2e9ae39ae1209d0a4f6d60a7"
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
