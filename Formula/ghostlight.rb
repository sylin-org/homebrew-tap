class Ghostlight < Formula
  desc "Governed browser automation over your own authenticated Chromium session (MCP)"
  homepage "https://sylin-org.github.io/ghostlight/"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.6.0/ghostlight-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "04e7b0328d7919e0769bd7e38947e35b37121e03fb4c70cd9c25a234372c7f78"
    else
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.6.0/ghostlight-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2c357227edb8793daab469f4000d986fc96dc99430ab331241ccccfa5dde68ca"
    end
  end

  on_linux do
    url "https://github.com/sylin-org/ghostlight/releases/download/v0.6.0/ghostlight-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2d054f0fb85d93af319a22de5671f94649a8651276a60305bcd1ee3e9cf05963"
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
