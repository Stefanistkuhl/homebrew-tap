class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  version "1.2.7"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.7/gns3util-darwin-arm64.tar.gz"
      sha256 "2bddd1c76316e96291f3a108b3a3567338253cd4d54a7ef25c3d6ae6003f9ef4"
    end
    on_intel do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.7/gns3util-darwin-amd64.tar.gz"
      sha256 "8e1d6be8221969d6932de1ed411f898161c0ed2ee601adcfc06b72753fc12e26"
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
