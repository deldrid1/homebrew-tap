class Beehiiv < Formula
  desc "Cross-platform Beehiiv API CLI"
  homepage "https://github.com/deldrid1/beehiiv-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.3/beehiiv_0.1.3_darwin_arm64.tar.gz"
      sha256 "d8e47d577345bba778e5b40457355e6d63d7fe74e7b289afea4cd7820aa83e11"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.3/beehiiv_0.1.3_darwin_x86_64.tar.gz"
      sha256 "7d4d5a95020f919224a8883fb12485191acfe9be4c88c1f1ac015fe06babb548"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.3/beehiiv_0.1.3_linux_arm64.tar.gz"
      sha256 "09f640109c8c3bad025e64b3bd201fca7dc9871dc1b39d3929f195944db265d2"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.3/beehiiv_0.1.3_linux_x86_64.tar.gz"
      sha256 "1644c7c10fe682c2c9098509aa7646d1f14ada11dd5e5f47f39758b8f7b966a6"
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
