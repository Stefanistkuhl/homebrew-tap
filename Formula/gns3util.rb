class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  version "1.2.8"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.8/gns3util-darwin-arm64.tar.gz"
      sha256 "27fabeafea3352603d381316b9c491a31367597b894230b440f942b69f470d76"
    end
    on_intel do
      url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.8/gns3util-darwin-amd64.tar.gz"
      sha256 "4a48571caca7f7623731f3e0d45c8bdce00046a8af6de093bfe4b19676367b65"
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
