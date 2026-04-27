class Peep < Formula
  desc "TLS diagnostic tool — peeps into handshakes and certificate chains"
  homepage "https://github.com/thexsa/peep"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-arm64"
      sha256 "2f245f4cdb7c4080f83534b1ec1195a799b810ca9aa664f8aecd80d1f5d77bbd"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-amd64"
      sha256 "b3b3dab191d0c08feb2ef4f6ddba87e9e9be2576eceaa95316b921217aa3577c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-arm64"
      sha256 "7de7bfe0f6ad1bef035afc9e35f6c9851ec61f33d3300c9ee1d20e7c8920acc4"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-amd64"
      sha256 "f00b26f1c0175df154d7f265ca9dc709e595b69e275b79b8cff638e1497a80e0"
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
