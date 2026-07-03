class Peep < Formula
  desc "TLS diagnostic tool — peeps into handshakes and certificate chains"
  homepage "https://github.com/thexsa/peep"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-arm64"
      sha256 "05a2a5bc72efe7875790278a67a2c8920a349f9a0b60ede7c13eb6ffea7071af"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-amd64"
      sha256 "b11dcf2cea5fd5a5756d10378f2a19fdbd9e4ab194f82b64c7eedfe18811567e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-arm64"
      sha256 "9342a1a7881156436881bdb56af45efa7fe3a8ff80f3af1faf9aad1fafe5d290"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-amd64"
      sha256 "c4f0822d1992c2ad814700e3081b549e074528363b2dd6607bae158486c765bb"
    end
  end

  def install
    binary = Dir["peep-*"].first || "peep"
    bin.install binary => "peep"
  end

  test do
    assert_match "peep", shell_output("#{bin}/peep --help")
  end
end
