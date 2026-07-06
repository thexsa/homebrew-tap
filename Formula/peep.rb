class Peep < Formula
  desc "TLS diagnostic tool — peeps into handshakes and certificate chains"
  homepage "https://github.com/thexsa/peep"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-arm64"
      sha256 "3de9a67d337b7b03a5591f35ad327474105c7130c8872b277fd8eced426cefe5"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-amd64"
      sha256 "071172720f89226fef2dcdf18a19a9ae8c563c2c298df8dc23ed4a2108e9917d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-arm64"
      sha256 "730dee61739ceca7f3785f9a6bd7900aa5452d1e8e93cc31fa8078850e10426b"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-amd64"
      sha256 "b878fd70f9f10386dc9cb310a23b347cdefc62a2da5137bd43e58042ccc1d73b"
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
