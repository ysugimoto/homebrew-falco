class Falco < Formula
  desc "VCL parser and linter optimized command for Fastly"
  homepage "https://github.com/ysugimoto/falco"
  version "${VERSION}"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/falco-darwin-amd64.tar.gz"
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/falco-darwin-arm64.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/v#{version}/falco-linux-amd64.tar.gz"
      else
        odie "Error: Unsupported Intel architecture."
      end
    elsif Hardware::CPU.arm?
      odie "Error: Unsupported ARM architecture."
    end
  end

  def install
    bin.install "falco"
  end

  test do
    system "#{bin}/falco", "-V"
  end
end
