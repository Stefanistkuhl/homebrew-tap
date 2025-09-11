class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  license "GPL-3.0-or-later"
  version "1.0.3"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.3/gns3util-darwin-arm64.tar.gz"
    sha256 "9b2ea64de96bce58c1595a8e19e4ca47e5944fc1a2ed7074f97255d202af6027"
  else
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.3/gns3util-darwin-amd64.tar.gz"
    sha256 "54e98e7375ebd0a97194764ad6aafc3c5c848519015f20f1c04d2d8b8451d776"
  end

  def install
    # Install the correct top-level binary and rename it to 'gns3util'
    binary = Hardware::CPU.arm? ? "gns3util-darwin-arm64" : "gns3util-darwin-amd64"
    bin.install binary => "gns3util"

    # Ship provided shell completions if present
    bash_completion.install "completions/gns3util.bash" => "gns3util" if File.exist?("completions/gns3util.bash")
    zsh_completion.install "completions/_gns3util" if File.exist?("completions/_gns3util")
    fish_completion.install "completions/gns3util.fish" if File.exist?("completions/gns3util.fish")
  end

  test do
    assert_match "gns3util", shell_output("#{bin}/gns3util --version")
  end
end
