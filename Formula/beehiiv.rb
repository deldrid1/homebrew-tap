class Beehiiv < Formula
  desc "Cross-platform Beehiiv API CLI"
  homepage "https://github.com/deldrid1/beehiiv-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.1/beehiiv_0.2.1_darwin_arm64.tar.gz"
      sha256 "eeb66e7efc157023993470c106c02d4b1ad12caa7a04531a5fd1e7ac24cd8bc5"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.1/beehiiv_0.2.1_darwin_x86_64.tar.gz"
      sha256 "7af562be3c19a1a8c34c7b54fdf73e0260a57009edbd392a80e703631cbb7a45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.1/beehiiv_0.2.1_linux_arm64.tar.gz"
      sha256 "f7d185ca53534848499f141b4a06eefa4914b1d4364048cd4cb656bf4450c52b"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.1/beehiiv_0.2.1_linux_x86_64.tar.gz"
      sha256 "6ac7c8ea9d92137ca669e583b3dd25ecfc9dfa901b1538a3bbde877f45d0e66c"
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
