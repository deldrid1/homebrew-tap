class Beehiiv < Formula
  desc "Cross-platform Beehiiv API CLI"
  homepage "https://github.com/deldrid1/beehiiv-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.0/beehiiv_0.1.0_darwin_arm64.tar.gz"
      sha256 "83f8fab584b9acb0c1730b20db4dd7f4964fdd4e8308ee8308f7d9db101473b7"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.0/beehiiv_0.1.0_darwin_x86_64.tar.gz"
      sha256 "7ec9df26bd45dea46286b9d6378bfe2640af4f54c47688e5bfc8dbf817df8d01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.0/beehiiv_0.1.0_linux_arm64.tar.gz"
      sha256 "b7a42a681a3f4165c9e50ff7911cb3745b3dd174900c33de3438b68cebe61424"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.1.0/beehiiv_0.1.0_linux_x86_64.tar.gz"
      sha256 "6da7f3861706aee1f8e813451484e147d3b8bf71f8f68a613695bc911910557d"
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
