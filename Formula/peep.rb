class Peep < Formula
  desc "TLS diagnostic tool — peeps into handshakes and certificate chains"
  homepage "https://github.com/thexsa/peep"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-arm64"
      sha256 "f874e0d4a4d77bc423b8bc4b68de3a04ca27a0c4ae3d5f74cc22fed4b8a96711"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-darwin-amd64"
      sha256 "25ab4bf8aac53457a19458d1597926b6beb1d5c2cb9546bc4c6dc20ae48a8d12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-arm64"
      sha256 "f26b09618717b8003d57dc45b807f89a8f403a92ae6100b2909e4f20730b22cc"
    else
      url "https://github.com/thexsa/peep/releases/download/v#{version}/peep-linux-amd64"
      sha256 "63e5b572e7c7d1303205fc305d07bdf2d7de1efd1be3742fef199de1e13e7c80"
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
