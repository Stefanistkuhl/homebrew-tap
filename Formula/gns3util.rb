class Gns3util < Formula
  desc "GNS3 API utility for managing GNS3v3 servers"
  homepage "https://github.com/Stefanistkuhl/gns3-api-util"
  url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.2/gns3util-darwin-amd64.tar.gz"
  sha256 "a569177a3527a4fd3527afacf8948f0938df15c6416c4c9147e495394b7d6ba3"
  license "GPL-3.0-or-later"
  version "1.0.2"

  # Detect architecture
  if Hardware::CPU.arm?
    url "https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.0.2/gns3util-darwin-arm64.tar.gz"
    sha256 "1c4d51414f334b04b5aaecefbc780204207fe9eb547a7f7c15a6fcbf05a0907f"
  end

  def install
    # Install the binary (rename from platform-specific name to gns3util)
    if Hardware::CPU.arm?
      bin.install "gns3util-darwin-arm64" => "gns3util"
    else
      bin.install "gns3util-darwin-amd64" => "gns3util"
    end
    
    # Install shell completions if they exist
    if File.exist?("completions/gns3util.bash")
      bash_completion.install "completions/gns3util.bash" => "gns3util"
    end
    if File.exist?("completions/_gns3util")
      zsh_completion.install "completions/_gns3util"
    end
    if File.exist?("completions/gns3util.fish")
      fish_completion.install "completions/gns3util.fish"
    end
    
    # Install man pages if they exist
    man1.install "man/gns3util.1" if File.exist?("man/gns3util.1")
  end

  test do
    system "#{bin}/gns3util", "--help"
  end
end
