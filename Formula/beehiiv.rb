class Beehiiv < Formula
  desc "Cross-platform Beehiiv API CLI"
  homepage "https://github.com/deldrid1/beehiiv-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.2/beehiiv_0.1.2_darwin_arm64.tar.gz"
      sha256 "30bedba96725d38d6c71fc98ddff8ffeda456b288a96e40f35869c73341d94e6"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.2/beehiiv_0.1.2_darwin_x86_64.tar.gz"
      sha256 "6d62f9606e17bb924e5be7e75742c8e9b23b8ab1062c42b48a012fd5f1df66a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.2/beehiiv_0.1.2_linux_arm64.tar.gz"
      sha256 "bb489329efa07d86e475ad0fb365cd1e4b181be78dbbaec2d1fb3f6b057ff289"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.2/beehiiv_0.1.2_linux_x86_64.tar.gz"
      sha256 "64d3bc3b374e15495b6320acc97501bf7dbe6e03f3105694e235ed6d7bfd66f4"
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
