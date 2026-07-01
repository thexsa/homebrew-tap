class Peep < Formula
  desc "TLS diagnostic tool — peeps into handshakes and certificate chains"
  homepage "https://github.com/thexsa/peep"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-arm64"
      sha256 "e3b34b66ed3d88ed70336f7a150a2ff3ed419fe9683ab7f723bd4d2d0d099d84"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-amd64"
      sha256 "d8738308ed1f31de87da24b76f684359877f8d0845c892adac612c79cc599004"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-arm64"
      sha256 "51b6f9c02de4a1bf502878236a65bd0ab5979561d4546ce71c0abdb0dfd33a4c"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-amd64"
      sha256 "c5248172bc5483f7a41c58ca1fb0a7509d0e81ed24e6d45dd479e7d694be95ce"
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
