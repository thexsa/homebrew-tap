class Peep < Formula
  desc "TLS diagnostic tool — peeps into handshakes and certificate chains"
  homepage "https://github.com/thexsa/peep"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-arm64"
      sha256 "2644cfb58bfdacb376200c3fd4aea091e70641432109f0ca56a2a2d547f71817"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-amd64"
      sha256 "b27ac501258438c2b77cae1958af43fdc84e32a2c02a8bfa33d61516ed89779f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-arm64"
      sha256 "ac992fde208c3d1ea0b28ebf604f307b08abc960b0fe2eea813333cd66740cd9"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-amd64"
      sha256 "81512e965ca8db498e93c71857bc17ea381662f52e83e151f9c42e196607b111"
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
