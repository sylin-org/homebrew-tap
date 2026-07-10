class Ghostlight < Formula
  desc "Governed browser automation over your own authenticated Chromium session (MCP)"
  homepage "https://sylin-org.github.io/ghostlight/"
  version "0.5.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.5.4/ghostlight-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "58875dadac6ba25c483a921915cc10e6f4747607813129361b98754143e19343"
    else
      url "https://github.com/sylin-org/ghostlight/releases/download/v0.5.4/ghostlight-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "40aaf27dd91727f3ea4095b88ae2284b31be8915ca9dcc8e15f8c2f888103b79"
    end
  end

  on_linux do
    url "https://github.com/sylin-org/ghostlight/releases/download/v0.5.4/ghostlight-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df9b5023bf8bd0bfebd360f0e62d8d8d67e4848b9f7e3e3dbc3def661fd83678"
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
