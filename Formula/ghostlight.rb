class Ghostlight < Formula
  desc "Governed browser automation over your own authenticated Chromium session (MCP)"
  homepage "https://sylin-org.github.io/ghostlight/"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.7.1/ghostlight-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "72a1d0ecbfb15c64cf8cb35f67713a3855c578d4deb3e6817e709f24200865a0"
    else
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.7.1/ghostlight-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "74fc0e28a0e7a2dc96efc51f8b79e04bb6a3f8b4c2dea838ad20d5d069bdd148"
    end
  end

  on_linux do
    url "https://github.com/sylin-org/ghostlight/releases/download/v0.7.1/ghostlight-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "316cb068902675c108bb0d153b7c3f17a93ffaca2b72963ba176ec6e7629276e"
  end

  def install
    # ADR-0046 as amended by ADR-0051: two executables ship in the archive
    # (ghostlight + the single role-selected ghostlight-relay pass-through).
    bin.install "ghostlight", "ghostlight-relay"
  end

  def caveats
    <<~EOS
      Connect the browser side (idempotent):
        ghostlight install
      then add the "Ghostlight in Browser" extension.
      Walkthrough: https://sylin-org.github.io/ghostlight/install.html
    EOS
  end

  test do
    system "#{bin}/ghostlight", "--version"
  end
end
