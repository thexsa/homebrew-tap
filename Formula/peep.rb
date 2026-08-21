class Peep < Formula
  desc "TLS diagnostic tool — peeps into handshakes and certificate chains"
  homepage "https://github.com/thexsa/peep"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-arm64"
      sha256 "3123277d5a71887f5811dda87eff529c5dd623480aeb827ae7ae582531d86459"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-amd64"
      sha256 "22b062c4a9b1e4171cb5ce3e30635266137596d761fa1aac12c069d78e6f3ac4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-arm64"
      sha256 "e4fc80cf85a1836c56b276366c795943782a227d464a4a49d0079c2d2c27b317"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-amd64"
      sha256 "b0572eca6a98ff6c35b86ef5416b743f30bd1953cda1d02ba73402da16972a59"
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
