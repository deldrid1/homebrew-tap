class Beehiiv < Formula
  desc "Cross-platform Beehiiv API CLI"
  homepage "https://github.com/deldrid1/beehiiv-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.6/beehiiv_0.1.6_darwin_arm64.tar.gz"
      sha256 "f47d82f28d9b7caef03ec33f7bad906fc9789d7a224abb3cd10188f23eb33821"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.6/beehiiv_0.1.6_darwin_x86_64.tar.gz"
      sha256 "f3a835541f79b8e2f0d1c94a28d7bf25e285aa41ab374e823d0fdd5f5cd35c4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.6/beehiiv_0.1.6_linux_arm64.tar.gz"
      sha256 "222808236322fcc33a0188be6df1bbd97673b23fb67c3a93f8b710796ad21354"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.6/beehiiv_0.1.6_linux_x86_64.tar.gz"
      sha256 "d60f6b2b366314368c4554789a3780753d8a44a16f193ab6f960bc9108a6c121"
    end
  end

  def install
    bin.install "beehiiv"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/beehiiv.bash" => "beehiiv"
    fish_completion.install "share/completions/beehiiv.fish"
    zsh_completion.install "share/completions/_beehiiv"
  end

  test do
    assert_match "beehiiv version", shell_output("#{bin}/beehiiv version")
  end
end
