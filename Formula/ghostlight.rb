class Ghostlight < Formula
  desc "Governed browser automation over your own authenticated Chromium session (MCP)"
  homepage "https://sylin-org.github.io/ghostlight/"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.7.0/ghostlight-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2456c1675e9e4ae598252267856a9287ecb4bfd885e67f99e84a9ad2e8796403"
    else
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.7.0/ghostlight-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "16e84162680eda2ffda77315fcfe99e7f7162b33f22a14b6301c56b1ec7fbe2d"
    end
  end

  on_linux do
    url "https://github.com/sylin-org/ghostlight/releases/download/v0.7.0/ghostlight-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "025f35d8b7b96ffdeda55fbb12b88ab4aeee6087cb4bc2ee869def835198e3e3"
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
