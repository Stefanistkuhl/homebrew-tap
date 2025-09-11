class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  license "GPL-3.0-or-later"
  version "1.0.3"

  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.3/gns3util-darwin-arm64.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  else
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.3/gns3util-darwin-arm64.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    # Pick the correct binary inside the tarball
    binary_name = Hardware::CPU.arm? ? "gns3util-darwin-arm64" : "gns3util-darwin-amd64"

    # Install and rename it to gns3util
    bin.install binary_name => "gns3util"

    # Shell completions
    bash_completion.install "completions/gns3util.bash" => "gns3util"
    zsh_completion.install "completions/_gns3util"
    fish_completion.install "completions/gns3util.fish"

    # Man pages (if they exist)
    man1.install "man/gns3util.1" if File.exist?("man/gns3util.1")
  end

  test do
    system "#{bin}/gns3util", "--help"
  end
end

